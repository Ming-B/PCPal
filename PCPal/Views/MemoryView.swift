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

    @State private var selectedMemoryName: String = "0"

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
                        }
                    } else {
                        Text("No Memory In Cart")
                            .foregroundColor(.gray)
                    }
                }

                Picker("Select Memory", selection: $selectedMemoryName) {
//                    Text("").tag("")
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
                print(savedMemory)
            }
        }
        .onChange(of: selectedMemoryName) { newName in
            if let newMemory = memories.first(where: { $0.name == newName }) {
                updateMemory(memory: newMemory)
            }
        }
    }
}

#Preview {
    MemoryView(memories: loadMemory(filename: "memory") ?? [])
}
