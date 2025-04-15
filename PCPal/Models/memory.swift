
import Foundation


struct Memory : Identifiable, Codable {
    let id = UUID()
    var name: String
    var price: Double?
    var modules: [Int]?
    var price_per_gb: Double?
    var color: String?
    var first_word_latency: Double?
    var cas_latency: Double?
}

func loadMemory(filename fileName: String) -> [Memory]? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([Memory].self, from: data)
            let oneThirdCount = max(1, jsonData.count / 5)
            return Array(jsonData.prefix(oneThirdCount))
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}
