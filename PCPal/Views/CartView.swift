//
//  CartView.swift
//  PCPal
//
//  Created by Ahmad on 4/14/25.
//

import SwiftUI
import SwiftData

struct CartView: View {
    @Query var carts: [Cart]
    @Environment(\.modelContext) private var modelContext
    
    var cart: Cart {
        if let existingCart = carts.first {
            return existingCart
        } else {
            let newCart = Cart()
            modelContext.insert(newCart)
            try? modelContext.save()
            return newCart
        }
    }
    
    var body: some View {
        Text("\nBuild Resources")
            .font(.largeTitle.bold())
            .foregroundStyle(.blue)
        Spacer()
        NavigationStack {
            VStack {
                HStack {
                    if let gpu = cart.gpu {
                        Text(gpu.name)
                    }
                    else {
                        Text("None")
                    }
                    NavigationLink(destination: GPUView(GPUS: loadJson(filename: "video-card") ?? [])) {
                        Text("GPU")
                    }
                }
                HStack {
                    if let cpu = cart.cpu {
                        Text(cpu.name)
                    }
                    else {
                        Text("None")
                    }
                    NavigationLink(destination: CPUView(CPUS: loadCPU(filename: "cpu") ?? [])) {
                        Text("CPU")
                    }
                }
                HStack {
                    if let motherboard = cart.motherboard {
                        Text(motherboard.name)
                    }
                    else {
                        Text("None")
                    }
                    NavigationLink(destination: MotherboardView(Motherboards: loadMotherboard(filename: "motherboard") ?? [])) {
                        Text("Motherboard")
                    }
                }
                HStack {
                    if let memory = cart.memory {
                        Text(memory.name)
                    }
                    else {
                        Text("None")
                    }
                    NavigationLink(destination: MemoryView(memories: loadMemory(filename: "memory") ?? [])) {
                        Text("Memory")
                    }
                }
                HStack {
                    if let harddrive = cart.harddrive {
                        Text(harddrive.name)
                    }
                    else {
                        Text("None")
                    }
                    NavigationLink(destination: StorageView(storages: loadStorage(filename: "internal-hard-drive") ?? [])) {
                        Text("Hard Drive")
                    }
                }
                HStack {
                    if let cooler = cart.cooler {
                        Text(cooler.name)
                    }
                    else {
                        Text("None")
                    }
                    NavigationLink(destination: CoolerView(coolers: loadCooler(filename: "cpu-cooler") ?? [])) {
                        Text("CPU Coolers")
                    }
                }
                HStack {
                    if let powersupply = cart.powersupply {
                        Text(powersupply.name)
                    }
                    else {
                        Text("None")
                    }
                    NavigationLink(destination: PowerSupplyView(PSUS: loadPSU(filename: "power-supply") ?? [])) {
                        Text("Power Supply")
                    }
                }
                HStack {
                    if let computercase = cart.computercase {
                        Text(computercase.name)
                    }
                    else {
                        Text("None")
                    }
                    NavigationLink(destination: ComputerCaseView(ComputerCases: loadCase(filename: "case") ?? []))  {
                        Text("Computer Case")
                    }
                }
            }
        }
    }
}

#Preview {
    CartView()
}
