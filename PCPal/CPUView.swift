//
//  CPUView.swift
//  PCPal
//
//  Created by Sam King on 4/12/25.
//

import SwiftUI
import SwiftData

struct CPUView: View {
    @State var CPUS: [CPU]
    @Query var carts: [Cart]
    @Environment(\.modelContext) private var modelContext

    @State private var selectedCPUName: String = ""

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

    func updateCPU(cpu: CPU) {
        cart.cpu = cpu
        try? modelContext.save()
    }

    var body: some View {
        VStack {
            List {
                HStack {
                    if let cpu = cart.cpu {
                        VStack(alignment: .leading) {
                            Text(cpu.name)
                            if let price = cpu.price {
                                Text("Price - $\(price, specifier: "%.2f")")
                            }
                        }
                    } else {
                        Text("No CPU In Cart")
                            .foregroundColor(.gray)
                    }
                }

                Picker("Select CPU", selection: $selectedCPUName) {
                    ForEach(CPUS, id: \.name) { cpu in
                        Text(cpu.name).tag(cpu.name)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
        }
        .onAppear {
            if let savedCPU = cart.cpu {
                selectedCPUName = savedCPU.name
                print(savedCPU)
            }
        }
        .onChange(of: selectedCPUName) { newName in
            if let newCPU = CPUS.first(where: { $0.name == newName }) {
                updateCPU(cpu: newCPU)
            }
        }
    }
}

#Preview {
    CPUView(CPUS: loadCPU(filename: "cpu") ?? [])
}

