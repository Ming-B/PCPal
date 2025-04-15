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
        NavigationStack {
            VStack {
                HStack {
                    if let gpu = cart.gpu {
                        Text(gpu.name)
                            .font(.headline)
                            .padding(20)
                    }
                    else {
                        Text("Select a GPU")
                            .font(.headline)
                            .padding(20)
                    }
                    Spacer()
                    NavigationLink(destination: GPUView(GPUS: loadJson(filename: "video-card") ?? [])) {
                        Text("  +  ")
                            .font(.largeTitle)
                        Spacer()
                    }
                }
                HStack {
                    if let cpu = cart.cpu {
                        Text(cpu.name)
                            .font(.headline)
                            .padding(20)
                    }
                    else {
                        Text("Select a CPU")
                            .font(.headline)
                            .padding(20)
                    }
                    Spacer()
                    NavigationLink(destination: CPUView(CPUS: loadCPU(filename: "cpu") ?? [])) {
                        Text("  +  ")
                            .font(.largeTitle)
                        Spacer()
                    }
                }
                HStack {
                    if let motherboard = cart.motherboard {
                        Text(motherboard.name)
                            .font(.headline)
                            .padding(20)
                    }
                    else {
                        Text("Select a Motherboard")
                            .font(.headline)
                            .padding(20)
                    }
                    Spacer()
                    NavigationLink(destination: MotherboardView(Motherboards: loadMotherboard(filename: "motherboard") ?? [])) {
                        Text("  +  ")
                            .font(.largeTitle)
                        Spacer()
                    }
                }
                HStack {
                    if let memory = cart.memory {
                        Text(memory.name)
                            .font(.headline)
                            .padding(20)
                    }
                    else {
                        Text("Select Memory")
                            .font(.headline)
                            .padding(20)
                    }
                    Spacer()
                    NavigationLink(destination: MemoryView(memories: loadMemory(filename: "memory") ?? [])) {
                        Text("  +  ")
                            .font(.largeTitle)
                        Spacer()
                    }
                }
                HStack {
                    if let harddrive = cart.harddrive {
                        Text(harddrive.name)
                            .font(.headline)
                            .padding(20)
                    }
                    else {
                        Text("Select Storage")
                            .font(.headline)
                            .padding(20)
                    }
                    Spacer()
                    NavigationLink(destination: StorageView(storages: loadStorage(filename: "internal-hard-drive") ?? [])) {
                        Text("  +  ")
                            .font(.largeTitle)
                        Spacer()
                    }
                }
                HStack {
                    if let cooler = cart.cooler {
                        Text(cooler.name)
                            .font(.headline)
                            .padding(20)
                    }
                    else {
                        Text("Select a Cooler")
                            .font(.headline)
                            .padding(20)
                    }
                    Spacer()
                    NavigationLink(destination: CoolerView(coolers: loadCooler(filename: "cpu-cooler") ?? [])) {
                        Text("  +  ")
                            .font(.largeTitle)
                        Spacer()
                    }
                }
                HStack {
                    if let powersupply = cart.powersupply {
                        Text(powersupply.name)
                            .font(.headline)
                            .padding(20)
                    }
                    else {
                        Text("Select a PSU")
                            .font(.headline)
                            .padding(20)
                    }
                    Spacer()
                    NavigationLink(destination: PowerSupplyView(PSUS: loadPSU(filename: "power-supply") ?? [])) {
                        Text("  +  ")
                            .font(.largeTitle)
                        Spacer()
                    }
                }
                HStack {
                    if let computercase = cart.computercase {
                        Text(computercase.name)
                            .font(.headline)
                            .padding(20)
                    }
                    else {
                        Text("Select a Case")
                            .font(.headline)
                            .padding(20)
                    }
                    Spacer()
                    NavigationLink(destination: ComputerCaseView(ComputerCases: loadCase(filename: "case") ?? []))  {
                        Text("  +  ")
                            .font(.largeTitle)
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    CartView()
}
