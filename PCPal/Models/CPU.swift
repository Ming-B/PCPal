import Foundation

struct CPU : Identifiable, Codable {
    let id = UUID()
    var name: String
    var price: Double?
    var core_count: Int?
    var core_clock: Double?
    var boost_clock: Double?
    var graphics: String?
    var smt: Bool?
}

func loadCPU(filename fileName: String) -> [CPU]? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([CPU].self, from: data)
            let oneThirdCount = max(1, jsonData.count / 3)
            return Array(jsonData.prefix(oneThirdCount))
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}

