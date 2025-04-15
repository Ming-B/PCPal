//
//  MemoryView.swift
//  PCPal
//
//  Created by Boyang Chen on 4/14/25.
//

import SwiftUI
import SwiftData

struct MemoryView: View {
    @State var memories: [Memory]
    @Query var carts: [Cart]
    @Environment(\.modelContext) private var modelContext

    @State private var selectedMemoryName: String = ""

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

    func updateMemory(memory: Memory) {
        cart.memory = memory
        try? modelContext.save()
    }

    var body: some View {
        VStack {
            List {
                HStack {
                    if let memory = cart.memory {
                        VStack(alignment: .leading) {
                            Text(memory.name)
                            if let price = memory.price {
                                Text("Price - $\(price, specifier: "%.2f")")
                            }
                            if let modules = memory.modules {
                                let totalSize = modules.reduce(0, +)
                                Text("Size - \(totalSize) GB (\(modules.count) x \(modules.first ?? 0) GB)")
                            }
                            if let price_per_gb = memory.price_per_gb {
                                Text("Price/GB - $\(price_per_gb, specifier: "%.2f")")
                            }
                            if let color = memory.color {
                                Text("Color - \(color)")
                            }
                            if let first_word_latency = memory.first_word_latency {
                                Text("First Word Latency - \(first_word_latency, specifier: "%.2f")")
                            }
                            if let cas_latency = memory.cas_latency {
                                Text("CAS Latency - \(cas_latency, specifier: "%.2f")")
                            }
                        }
                    } else {
                        Text("No Memory In Cart")
                            .foregroundColor(.gray)
                    }
                }

                Picker("Select Memory", selection: $selectedMemoryName) {
                    Text("").tag("")
                    ForEach(memories, id: \.id) { memory in
                        Text(memory.name).tag(memory.name)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
        }
        .onAppear {
            if let savedMemory = cart.memory {
                selectedMemoryName = savedMemory.name
                //print(savedMemory)
            }
        }
        .onChange(of: selectedMemoryName) { oldValue, newName in
            if let newMemory = memories.first(where: { $0.name == newName }) {
                updateMemory(memory: newMemory)
            }
        }
    }
}

#Preview {
    MemoryView(memories: loadMemory(filename: "memory") ?? [])
}
