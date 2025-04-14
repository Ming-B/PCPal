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
                //                NavigationLink(destination: GPUView()) {
                //                    Text("CPU")
                //                }
                //                NavigationLink(destination: GPUView()) {
                //                    Text("Motherboard")
                //                }
                //                NavigationLink(destination: GPUView()) {
                //                    Text("Memory")
                //                }
                //                NavigationLink(destination: GPUView()) {
                //                    Text("HardDrive")
                //                }
                //                NavigationLink(destination: GPUView()) {
                //                    Text("Cooler")
                //                }
                //                NavigationLink(destination: GPUView()) {
                //                    Text("Power Supply")
                //                }
                //                NavigationLink(destination: GPUView()) {
                //                    Text("PC Case")
                //                }
            }
            .navigationTitle("Cart")
        }
    }
}

#Preview {
    CartView()
}
