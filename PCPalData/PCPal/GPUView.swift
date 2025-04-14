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

    var selectedGPU: GPU? {
        GPUS.first(where: { $0.name == selectedGPUName })
    }

    var body: some View {
        VStack {
            List {
                HStack {
                    if let gpu = selectedGPU ?? carts.first?.gpu {
                        VStack {
                            Text(gpu.name)
                            Text("Price - \(String(describing: gpu.price))")
                            Text("Memory - \(String(describing: gpu.memory))")
                        }
                    } else {
                        Text("No GPU In Cart")
                            .foregroundColor(.gray)
                    }
                }

                Picker("Select GPU", selection: $selectedGPUName) {
                    ForEach(GPUS, id: \.name) { gpu in
                        Text(gpu.name)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
        }
        .onAppear {
            if selectedGPUName.isEmpty, let gpu = carts.first?.gpu {
                selectedGPUName = gpu.name
            }
        }
    }
}

#Preview {
    GPUView(GPUS: loadJson(filename: "video-card") ?? [])
}
