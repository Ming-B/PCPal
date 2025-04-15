import Foundation

struct GPU : Identifiable, Codable {
    let id = UUID()
    var name: String
    var price: Double?
    var chipset: String?
    var memory: Double?
    var core_clock: Double?
    var boost_clock: Double?
    var color: String?
    var length: Double?
}

func loadJson(filename fileName: String) -> [GPU]? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([GPU].self, from: data)
            let oneThirdCount = max(1, jsonData.count / 5)
            return Array(jsonData.prefix(oneThirdCount))
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}
