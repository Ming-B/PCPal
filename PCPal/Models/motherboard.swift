import Foundation

struct Motherboard : Identifiable, Codable {
    let id = UUID()
    var name: String
    var price: Double?
    var socket: String?
    var form_factor: String?
    var max_memory: Int?
    var memory_slots: Int?
    var color: String?
}

func loadMotherboard(filename fileName: String) -> [Motherboard]? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([Motherboard].self, from: data)
            let oneThirdCount = max(1, jsonData.count / 5)
            return Array(jsonData.prefix(oneThirdCount))
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}
