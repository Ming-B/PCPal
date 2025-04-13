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
                            CPU: Intel Core i5-10300H
                            GPU: NVIDIA GTX 1650 Super
                            RAM: 8GB DDR4
                            Storage: 512GB SSD
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
                            RAM: 16GB DDR4
                            Storage: 1TB SSD
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
                            CPU: Intel Core i9-13900K
                            GPU: NVIDIA RTX 4090
                            RAM: 32GB DDR5
                            Storage: 2TB NVMe SSD
                            OS: Windows 11 Pro›
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
