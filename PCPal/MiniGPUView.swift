//
//  MiniGPUView.swift
//  PCPal
//
//  Created by Sam King on 4/12/25.
//

import SwiftUI

struct MiniGPUView: View {
    @Binding var GPU:GPU
    var body: some View {
        VStack (alignment: .leading){
            Text(GPU.name)
            HStack{
                Text("$\(String(format: "%.2f", GPU.price ?? 0.0))")
                Text("Clock: \(String(format: "%.2f", GPU.core_clock ?? 0.0)) GHz / \(String(format: "%.2f", GPU.boost_clock ?? 0.0)) GHz")
            }
            Text("\(GPU.chipset ?? "")")
                .fontWeight(.ultraLight)
        }
    }
}

#Preview {
    @Previewable @State var gpu = GPU(name: "name", price: 100.0, chipset: "chip", memory: 1000.0, core_clock: 4.0, boost_clock: 5.0, color: "black", length: 100.0)
    MiniGPUView(GPU: $gpu)
}
