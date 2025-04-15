import Foundation

struct CPUCooler : Identifiable, Codable {
    let id = UUID()
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
            let oneThirdCount = max(1, jsonData.count / 5)
            return Array(jsonData.prefix(oneThirdCount))
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}
