import Foundation


struct Storage : Identifiable, Codable {
    let id = UUID()
    var name: String
    var price: Double?
    var capacity: Double?
    var price_per_gb: Double?
    var cache: Int?
    var interface: String?
}

func loadStorage(filename fileName: String) -> [Storage]? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([Storage].self, from: data)
            let oneThirdCount = max(1, jsonData.count / 5)
            return Array(jsonData.prefix(oneThirdCount))
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}
