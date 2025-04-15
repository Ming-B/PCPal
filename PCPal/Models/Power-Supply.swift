import Foundation


struct PSU : Identifiable, Codable {
    var id = UUID()
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
            return jsonData
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}
