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
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: GPUView(GPUS: loadJson(filename: "video-card") ?? [])) {
                    Text("GPU")
                }
                
                NavigationLink(destination: CPUView(CPUS: loadCPU(filename: "cpu") ?? [])) {
                    Text("CPU")
                }
                NavigationLink(destination: MotherboardView(Motherboards: loadMotherboard(filename: "motherboard") ?? [])) {
                    Text("Motherboard")
                }
                NavigationLink(destination: MemoryView(memories: loadMemory(filename: "memory") ?? [])) {
                    Text("Memory")
                }
                NavigationLink(destination: StorageView(storages: loadStorage(filename: "internal-hard-drive") ?? [])) {
                    Text("Hard Drive")
                }
                NavigationLink(destination: CoolerView(coolers: loadCooler(filename: "cpu-cooler") ?? [])) {
                    Text("CPU Coolers")
                }
                NavigationLink(destination: PowerSupplyView(PSUS: loadPSU(filename: "power-supply") ?? [])) {
                    Text("Power Supply")
                }
                NavigationLink(destination: ComputerCaseView(ComputerCases: loadCase(filename: "case") ?? []))  {
                    Text("Computer Case")
                }
            }
            .navigationTitle("Cart")
        }
    }
}

#Preview {
    CartView()
}
