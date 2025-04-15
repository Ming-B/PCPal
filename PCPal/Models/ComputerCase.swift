import Foundation

struct ComputerCase : Identifiable, Codable {
    var id = UUID()
    var name: String
    var type: String?
    var color: String?
    var psu: Double?
    var side_panel: String?
    var external_volume: Double?
    var internal_35_bays: Int?
}

func loadCase(filename fileName: String) -> [ComputerCase]? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([ComputerCase].self, from: data)
            return jsonData
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}
