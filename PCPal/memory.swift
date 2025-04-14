
import Foundation

enum Speed:Codable {
    case int(Int)
    case array([Int])
}

struct Memory : Identifiable, Codable {
    let id = UUID()
    var name: String
    var price: Double?
    var speed: Speed? // could be a singular value
    var modules: [Int]?
    var price_per_gb: Double?
    var color: String?
    var first_word_latency: Double?
    var cas_latency: Double?
    
    enum CodingKeys: String, CodingKey {
            case name, price, speed, modules, price_per_gb, color, first_word_latency, cas_latency
        }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.price = try container.decodeIfPresent(Double.self, forKey: .price)
        self.modules = try container.decodeIfPresent([Int].self, forKey: .modules)
        self.price_per_gb = try container.decodeIfPresent(Double.self, forKey: .price_per_gb)
        self.color = try container.decodeIfPresent(String.self, forKey: .color)
        self.first_word_latency = try container.decodeIfPresent(Double.self, forKey: .first_word_latency)
        self.cas_latency = try container.decodeIfPresent(Double.self, forKey: .cas_latency)
        
        if let value = try? container.decode(Int.self, forKey: .speed) {
            self.speed = .int(value)
        } else if let value = try? container.decode([Int].self, forKey: .speed) {
            self.speed = .array(value)
        } else {
            self.speed = nil
        }
    }
}

func loadMemory(filename fileName: String) -> [Memory]? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([Memory].self, from: data)
            return jsonData
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}
