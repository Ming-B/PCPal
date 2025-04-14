import Foundation

enum StorageType: Codable {
    case int(Int)
    case string(String)
}

enum FormFactor: Codable{
    case string(String)
    case double(Double)
}

struct Storage : Identifiable, Codable {
    let id = UUID()
    var name: String
    var price: Double?
    var capacity: Double?   // A couple of these values are doubles for some random reason
    var price_per_gb: Double?
    var type: StorageType?  // Could be string or int
    var cache: Int?
    var form_factor: FormFactor? // Could be string or double
    var interface: String?
    
    enum CodingKeys: String, CodingKey {
            case name, price, capacity, price_per_gb, type, cache, form_factor, interface
        }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.price = try container.decodeIfPresent(Double.self, forKey: .price)
        self.capacity = try container.decodeIfPresent(Double.self, forKey: .capacity)
        self.price_per_gb = try container.decodeIfPresent(Double.self, forKey: .price_per_gb)
        self.cache = try container.decodeIfPresent(Int.self, forKey: .cache)
        self.interface = try container.decodeIfPresent(String.self, forKey: .interface)
        
        if let value = try? container.decode(Int.self, forKey: .type) {
            self.type = .int(value)
        } else if let value = try? container.decode(String.self, forKey: .type) {
            self.type = .string(value)
        } else {
            self.type = nil
        }
        
        if let value = try? container.decode(Double.self, forKey: .form_factor){
            self.form_factor = .double(value)
        } else if let value = try? container.decode(String.self, forKey: .form_factor) {
            self.form_factor = .string(value)
        } else {
            self.form_factor = nil
        }
    }
}

func loadStorage(filename fileName: String) -> [Storage]? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([Storage].self, from: data)
            return jsonData
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}
