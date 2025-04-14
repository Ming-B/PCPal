//
//  GPUView.swift
//  PCPal
//
//  Created by Sam King on 4/12/25.
//

import SwiftUI

struct GPUView: View {
//    @State var GPUS: [GPU]
    @State var GPUS: [GPU]
    var body: some View {
        VStack{
            List {
                ForEach($GPUS) { $gpu in
                    MiniGPUView(GPU: $gpu)
                }
            }
        }
    }
}

#Preview {
    GPUView(GPUS: loadGPU(filename: "video-card") ?? [])
}
