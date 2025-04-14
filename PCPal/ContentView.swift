//
//  CartView.swift
//  PCPal
//
//  Created by Ahmad on 4/14/25.
//

import SwiftUI
import SwiftData

struct CartView: View {
    @Query var carts: [PCCart]
    @Environment(\.modelContext) private var modelContext
    @State private var selectedPartType: PartType?

    var cart: PCCart {
        if let cart = carts.first {
            return cart
        } else {
            let newCart = PCCart()
            modelContext.insert(newCart)
            return newCart
        }
    }

    var body: some View {
        NavigationStack {
            List {
                partRow("GPU", value: cart.gpu?.name) { selectedPartType = .gpu }
                partRow("CPU", value: cart.cpu?.name) { selectedPartType = .cpu }
                partRow("Memory", value: cart.memory?.name) { selectedPartType = .memory }
                partRow("Hard Drive", value: cart.harddrive?.name) { selectedPartType = .harddrive }
                partRow("Motherboard", value: cart.motherboard?.name) { selectedPartType = .motherboard }
                partRow("Case", value: cart.pccase?.name) { selectedPartType = .pccase }
                partRow("Power Supply", value: cart.powersupply?.name) { selectedPartType = .powersupply }
                partRow("Cooler", value: cart.cooler?.name) { selectedPartType = .cooler }
            }
            .navigationTitle("Your PC Cart")
        }
        .sheet(item: $selectedPartType) { partType in
            PartSelectionSheet(partType: partType, cart: cart)
        }
    }

    private func partRow(_ label: String, value: String?, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Text(label)
                Spacer()
                Text(value ?? "Select").foregroundColor(.gray)
            }
        }
    }
}

enum PartType: String, Identifiable, CaseIterable {
    case gpu, cpu, memory, harddrive, motherboard, pccase, powersupply, cooler

    var id: String { rawValue }

    var label: String {
        rawValue.capitalized
    }
}

struct PartSelectionSheet: View {
    let partType: PartType
    let cart: PCCart
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        NavigationStack {
            List(partOptions, id: \.name) { part in
                Button(part.name) {
                    updateCart(with: part)
                    dismiss()
                }
            }
            .navigationTitle("Select \(partType.label)")
        }
    }

    private func updateCart(with part: any NamedPart) {
        switch partType {
        case .gpu:
            cart.gpu = part as? GPU
        case .cpu:
            cart.cpu = part as? CPU
        case .memory:
            cart.memory = part as? Memory
        case .harddrive:
            cart.harddrive = part as? HardDrive
        case .motherboard:
            cart.motherboard = part as? Motherboard
        case .pccase:
            cart.pccase = part as? PCCase
        case .powersupply:
            cart.powersupply = part as? PowerSupply
        case .cooler:
            cart.cooler = part as? Cooler
        }

        do {
            try modelContext.save()
        } catch {
            print("Failed to save context: \(error.localizedDescription)")
        }
    }
    // Generated list to use as test: delete later
    private var partOptions: [any NamedPart] {
        switch partType {
        case .gpu:
            return [GPU(id: 1, name: "RTX 4090"), GPU(id: 2, name: "RX 7900 XTX")]
        case .cpu:
            return [CPU(id: 1, name: "Ryzen 9 7950X"), CPU(id: 2, name: "i9-13900K")]
        case .memory:
            return [Memory(id: 1, name: "Corsair 32GB DDR5"), Memory(id: 2, name: "G.Skill 16GB DDR4")]
        case .harddrive:
            return [HardDrive(id: 1, name: "Samsung 980 Pro 1TB"), HardDrive(id: 2, name: "WD Black 2TB")]
        case .motherboard:
            return [Motherboard(id: 1, name: "ASUS ROG Z790"), Motherboard(id: 2, name: "MSI B650 Tomahawk")]
        case .pccase:
            return [PCCase(id: 1, name: "NZXT H510"), PCCase(id: 2, name: "Fractal Design Meshify C")]
        case .powersupply:
            return [PowerSupply(id: 1, name: "Corsair RM850x"), PowerSupply(id: 2, name: "EVGA SuperNOVA 750")]
        case .cooler:
            return [Cooler(id: 1, name: "Noctua NH-D15"), Cooler(id: 2, name: "Corsair iCUE H150i")]
        }
    }
}


protocol NamedPart {
    var name: String { get }
}

extension GPU: NamedPart {}
extension CPU: NamedPart {}
extension Memory: NamedPart {}
extension HardDrive: NamedPart {}
extension Motherboard: NamedPart {}
extension PCCase: NamedPart {}
extension PowerSupply: NamedPart {}
extension Cooler: NamedPart {}

#Preview {
    CartView()
}

//
//  PCCart.swift
//  PCPal
//
//  Created by Ahmad on 4/13/25.
//

@Model
class PCCart {
    var gpu:GPU?
    var cpu:CPU?
    var memory:Memory?
    var harddrive:HardDrive?
    var pccase:PCCase?
    var powersupply:PowerSupply?
    var cooler:Cooler?
    var motherboard:Motherboard?

    init(gpu: GPU? = nil, cpu: CPU? = nil, memory: Memory? = nil, harddrive: HardDrive? = nil,
         pccase: PCCase? = nil, powersupply: PowerSupply? = nil, cooler: Cooler? = nil, motherboard: Motherboard? = nil) {
        self.gpu = gpu
        self.cpu = cpu
        self.memory = memory
        self.harddrive = harddrive
        self.pccase = pccase
        self.powersupply = powersupply
        self.cooler = cooler
        self.motherboard = motherboard
    }
}

//Delete these later
struct GPU : Identifiable, Codable {
    let id:Int
    var name: String
    var price: Double?
    var chipset: String?
    var memory: Double?
    var core_clock: Double?
    var boost_clock: Double?
    var color: String?
    var length: Double?
}

struct CPU : Identifiable, Codable {
    let id:Int
    var name: String
    var price: Double?
    var corecount: Int?
    var coreclock: Double?
    var boostclock: Double?
    var TDP: Double?
    var graphics: String?
}

struct Memory : Identifiable, Codable {
    let id:Int
    var name: String
    var price: Double?
    var priceperGB: Double?
    var ram: Int?
    var speed: Double?
}

struct Motherboard : Identifiable, Codable {
    let id:Int
    var name: String
    var price: Double?
    var socket: String?
    var maxmemory: Double?
    var memoryslots: Int?
    var color: String?
}

struct Cooler : Identifiable, Codable {
    let id:Int
    var name: String
    var price: Double?
    var rpm: Double?
    var size: Double?
    var color: String?
}

struct HardDrive : Identifiable, Codable {
    let id:Int
    var name: String
    var price: Double?
    var rpm: Double?
    var size: Double?
    var color: String?
}

struct PowerSupply : Identifiable, Codable {
    let id:Int
    var name: String
    var price: Double?
    var rpm: Double?
    var size: Double?
    var color: String?
}

struct PCCase : Identifiable, Codable {
    let id:Int
    var name: String
    var price: Double?
    var rpm: Double?
    var size: Double?
    var color: String?
}

