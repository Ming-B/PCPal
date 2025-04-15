import Foundation

struct CPU : Identifiable, Codable {
    var id = UUID()
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
            return jsonData
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}
