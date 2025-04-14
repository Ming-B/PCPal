import Foundation

enum RPM: Codable {
    case int(Int)
    case array([Int])
}

enum NoiseLevel:Codable {
    case double(Double)
    case array([Double])
}

struct CPUCooler : Identifiable, Codable {
    let id = UUID()
    var name: String
    var price: Double?
    var rpm: RPM? // Could be an array
    var noise_level: NoiseLevel?
    var boost_clock: Double?
    var graphics: String?
    var smt: Bool?
    
    enum CodingKeys: String, CodingKey {
            case name, price, rpm, noise_level, boost_clock, graphics, smt
        }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.price = try container.decodeIfPresent(Double.self, forKey: .price)
        self.boost_clock = try container.decodeIfPresent(Double.self, forKey: .boost_clock)
        self.graphics = try container.decodeIfPresent(String.self, forKey: .graphics)
        self.smt = try container.decodeIfPresent(Bool.self, forKey: .smt)
        
        if let value = try? container.decode(Int.self, forKey: .rpm) {
            self.rpm = .int(value)
        } else if let value = try? container.decode([Int].self, forKey: .rpm) {
            self.rpm = .array(value)
        } else {
            self.rpm = nil
        }
        
        if let value = try? container.decode(Double.self, forKey: .noise_level) {
            self.noise_level = .double(value)
        } else if let value = try? container.decode([Double].self, forKey: .noise_level) {
            self.noise_level = .array(value)
        } else {
            self.rpm = nil
        }
    }
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
