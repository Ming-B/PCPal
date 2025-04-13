//
//  OurRecommendationView.swift
//  PCPal
//
//  Created by Boyang Chen on 4/8/25.
//

import SwiftUI

struct OurRecommendationView: View {
    @State private var showBudget = false;
    @State private var showMid = false;
    @State private var showHigh = false;


    
    var body: some View {
        Text("Our PC Builds")
            .font(.largeTitle)
            .foregroundStyle(.blue)
            .padding()
        
        Spacer()
        
   
            HStack {
                Button("", systemImage: "chevron.right") {
                    withAnimation(.linear) {
                        showBudget.toggle()
   
                    }
                }
                .rotationEffect(.degrees(showBudget ? 90 : 0))
                Section(header: Text("Budget Tier").font(.headline)) {
                    
                    if showBudget {
                        Text("CPU: Intel Core i5-10300H\nGPU: NVIDIA GeForce GTX 1650 Super\nRAM: 8GB DDR4\nStorage: 512GB SSD\nOperating System: Windows 10 Home")
                    }
                    
                    
                }
            }
            .padding()
        
            Spacer()
            
        HStack {
            Button("", systemImage: "chevron.right") {
                withAnimation(.linear) {
                    showMid.toggle()
                }
            }
            .rotationEffect(.degrees(showMid ? 90 : 0))
            Section(header: Text("Mid-Tier").font(.headline)) {
                
                if showMid {
                    Text("CPU: Intel Core i5-10300H\nGPU: NVIDIA GeForce GTX 1650 Super\nRAM: 8GB DDR4\nStorage: 512GB SSD\nOperating System: Windows 10 Home")
                }
                
                
            }
        }
        .padding()
            
            Spacer()
            
        HStack {
            Button("", systemImage: "chevron.right") {
                withAnimation(.linear) {
                    showHigh.toggle()
                }
            }
            .rotationEffect(.degrees(showHigh ? 90 : 0))
            Section(header: Text("High End").font(.headline)) {
                
                if showHigh {
                    Text("CPU: Intel Core i5-10300H\nGPU: NVIDIA GeForce GTX 1650 Super\nRAM: 8GB DDR4\nStorage: 512GB SSD\nOperating System: Windows 10 Home")
                }
                
                
            }
        }
        .padding()
            Spacer()
        }
        
        
    
}

#Preview {
    OurRecommendationView()
}
