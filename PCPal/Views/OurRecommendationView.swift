//
//  OurRecommendationView.swift
//  PCPal
//
//  Created by Boyang Chen on 4/8/25.
//

import SwiftUI

struct OurRecommendationView: View {
    @State private var showBudgetDetails = false
    @State private var showMidDetails = false
    @State private var showHighDetails = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text("Our PC Builds")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.blue)
                
                // Budget Tier Section
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Label("Budget Build", systemImage: "dollarsign")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    Divider()
                    Text("""
                            CPU: AMD Ryzen 5 7600
                            GPU: NVIDIA GTX 1080 Ti
                            RAM: 32GB DDR4
                            Motherboard: MSI B650 Gaming
                            Storage: 1 TB SSD
                            PSU: 600+ Watts
                            OS: Windows 10 Home
                            """)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 4)
                
                // Mid Tier Section
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Label("Mid Tier", systemImage: "speedometer")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    Divider()
                    Text("""
                            CPU: AMD Ryzen 5 5600X
                            GPU: NVIDIA RTX 3060
                            RAM: 32GB DDR5
                            Motherboard: MSI B550M Pro 
                            Storage: 2TB SSD
                            PSU: 800+ Watts
                            OS: Windows 11 Home
                            """)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 4)
                
                // High End Section
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Label("High End", systemImage: "flame.fill")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    Divider()
                    Text("""
                            CPU: Ryzen 7 9800X3D
                            GPU: NVIDIA RTX 4090
                            RAM: 32GB DDR5
                            Motherboard: ASRock X870E Taichi
                            Storage: 2TB NVMe SSD
                            PSU: 1200+ Watts
                            OS: Windows 11 Home
                            """)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 4)
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    OurRecommendationView()
}
