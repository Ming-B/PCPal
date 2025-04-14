import Foundation

enum Modular:Codable {
    case string(String)
    case bool(Bool)
}

struct PSU : Identifiable, Codable {
    let id = UUID()
    var name: String
    var price: Double?
    var type: String?
    var efficiency: String?
    var wattage: Int?
    var modular: Modular? // Could be a string or a boolean
    var color: String?
    
    enum CodingKeys: String, CodingKey {
            case name, price, type, efficiency, wattage, modular, color
        }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.price = try container.decodeIfPresent(Double.self, forKey: .price)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.efficiency = try container.decodeIfPresent(String.self, forKey: .efficiency)
        self.wattage = try container.decodeIfPresent(Int.self, forKey: .wattage)
        self.color = try container.decodeIfPresent(String.self, forKey: .color)
        
        if let value = try? container.decode(String.self, forKey: .modular) {
            self.modular = .string(value)
        } else if let value = try? container.decode(Bool.self, forKey: .modular) {
            self.modular = .bool(value)
        } else {
            self.type = nil
        }
        
    }
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
