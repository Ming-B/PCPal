//
//  OurRecommendationView.swift
//  PCPal
//
//  Created by Boyang Chen on 4/8/25.
//

import SwiftUI

struct OurRecommendationView: View {
    @State private var showDetails = false;
    @State private var chevronRotate = 0.0
    
    var body: some View {
        Text("Our PC Builds")
            .font(.largeTitle)
            .foregroundStyle(.blue)
            .padding()
        
        Spacer()
        
   
            HStack {
                Button("", systemImage: "chevron.right") {
                    withAnimation(.linear) {
                        showDetails.toggle()
                        if showDetails {
                            chevronRotate += 90.0
                        }
                        else {
                            chevronRotate -= 90.0
                        }
                    }
                }
                .rotationEffect(.degrees(chevronRotate))
                Section(header: Text("Budget Tier").font(.headline)) {
                    
                    if showDetails {
                        Text("CPU: Intel Core i5-10300H\nGPU: NVIDIA GeForce GTX 1650 Super\nRAM: 8GB DDR4\nStorage: 512GB SSD\nOperating System: Windows 10 Home")
                    }
                    
                    
                }
            }
            .padding()
        
            Spacer()
            
        HStack {
            Button("", systemImage: "chevron.right") {
                withAnimation(.linear) {
                    showDetails.toggle()
                    if showDetails {
                        chevronRotate += 90.0
                    }
                    else {
                        chevronRotate -= 90.0
                    }
                }
            }
            .rotationEffect(.degrees(chevronRotate))
            Section(header: Text("Mid-Tier").font(.headline)) {
                
                if showDetails {
                    Text("CPU: Intel Core i5-10300H\nGPU: NVIDIA GeForce GTX 1650 Super\nRAM: 8GB DDR4\nStorage: 512GB SSD\nOperating System: Windows 10 Home")
                }
                
                
            }
        }
        .padding()
            
            Spacer()
            
        HStack {
            Button("", systemImage: "chevron.right") {
                withAnimation(.linear) {
                    showDetails.toggle()
                    if showDetails {
                        chevronRotate += 90.0
                    }
                    else {
                        chevronRotate -= 90.0
                    }
                }
            }
            .rotationEffect(.degrees(chevronRotate))
            Section(header: Text("High End").font(.headline)) {
                
                if showDetails {
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
