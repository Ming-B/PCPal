import Foundation


struct PSU : Identifiable, Codable {
    let id = UUID()
    var name: String
    var price: Double?
    var type: String?
    var efficiency: String?
    var wattage: Int?
    var color: String?
}

func loadPSU(filename fileName: String) -> [PSU]? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([PSU].self, from: data)
            let oneThirdCount = max(1, jsonData.count / 5)
            return Array(jsonData.prefix(oneThirdCount))
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}
