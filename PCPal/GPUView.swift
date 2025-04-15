//
//  GPUView.swift
//  PCPal
//
//  Created by Sam King on 4/12/25.
//

import SwiftUI
import SwiftData

struct GPUView: View {
    @State var GPUS: [GPU]
    @Query var carts: [Cart]
    @Environment(\.modelContext) private var modelContext

    @State private var selectedGPUName: String = ""

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

    func updateGPU(gpu: GPU) {
        cart.gpu = gpu
        try? modelContext.save()
    }

    var body: some View {
        VStack {
            List {
                HStack {
                    if let gpu = cart.gpu {
                        VStack(alignment: .leading) {
                            Text(gpu.name)
                            if let price = gpu.price {
                                Text("Price - $\(price, specifier: "%.2f")")
                            }
                            if let memory = gpu.memory {
                                Text("Memory - \(memory, specifier: "%.0f") GB")
                            }
                        }
                    } else {
                        Text("No GPU In Cart")
                            .foregroundColor(.gray)
                    }
                }

                Picker("Select GPU", selection: $selectedGPUName) {
                    ForEach(GPUS, id: \.id) { gpu in
                        Text(gpu.name).tag(gpu.name)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
        }
        .onAppear {
            if let savedGPU = cart.gpu {
                selectedGPUName = savedGPU.name
                print(savedGPU)
            }
        }
        .onChange(of: selectedGPUName) { newName in
            if let newGPU = GPUS.first(where: { $0.name == newName }) {
                updateGPU(gpu: newGPU)
            }
        }
    }
}

#Preview {
    GPUView(GPUS: loadJson(filename: "video-card") ?? [])
}
