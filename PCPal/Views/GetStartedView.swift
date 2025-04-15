//
//  GetStartedView.swift
//  PCPal
//
//  Created by Boyang Chen on 4/8/25.
//

import SwiftUI

struct GetStartedView: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .center, spacing: 16) {
                Text("Getting Started")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.blue)
                
                HStack {
                    Text("Welcome to PCPal")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                }
                Text("""
                        PCPal is your all-in-one companion guide app for building your dream PC. Whether you are new to PC building or already have a few builds under your belt, this app is designed to give you everything you need — all in one place.
                        
                        Use PCPal to explore essential components, read helpful guides, and get personalized recommendations to make smart choices on your next build.
                        """)
                Divider()
                HStack {
                    Text("What is a PC and why build one?")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                }
                Text("""
                        A PC, or personal computer, is a computer built to perform a wide variety of tasks — from gaming and content creation to schoolwork and everyday browsing.
                        
                        Building your own PC means choosing and assembling each component yourself: the CPU, GPU, motherboard, memory, storage, and more. It not only helps you save money, but also gives you full control over performance, aesthetics, and upgradeability. Plus, it’s fun to build something tailored just for you.
                        """)
                .font(.body)
            }
            .padding()
        }
    }
}

#Preview {
    GetStartedView()
}
