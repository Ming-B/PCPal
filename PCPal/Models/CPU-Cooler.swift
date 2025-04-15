import Foundation

struct CPUCooler : Identifiable, Codable {
    var id = UUID()
    var name: String
    var price: Double?
    var boost_clock: Double?
    var graphics: String?
    var smt: Bool?
}

func loadCooler(filename fileName: String) -> [CPUCooler]? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([CPUCooler].self, from: data)
            return jsonData
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}
