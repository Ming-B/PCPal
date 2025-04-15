//
//  ComputerPartsView.swift
//  PCPal
//
//  Created by Boyang Chen on 4/8/25.
//

import SwiftUI

struct ComputerPartsView: View {
    @AppStorage("readerModeEnabled") private var readerModeEnabled = false
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 10) {
                Text("Computer Parts")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.blue)
                
                List {
                    NavigationLink(destination: ComputerCaseExView()) {
                        Image(systemName: "desktopcomputer")
                        Text("Computer Cases")
                            .font(.title3)
                            .padding(.vertical, 12)
                    }
                    NavigationLink(destination: CPUCoolerExView()) {
                        Image(systemName: "fan")
                        Text("CPU Coolers")
                            .font(.title3)
                            .padding(.vertical, 12)
                    }
                    NavigationLink(destination: CPUExView()) {
                        Image(systemName: "cpu")
                        Text("CPUs")
                            .font(.title3)
                            .padding(.vertical, 12)
                    }
                    NavigationLink(destination: GPUExView()) {
                        Image(systemName: "video.square.fill")
                        Text("Graphics Cards")
                            .font(.title3)
                            .padding(.vertical, 12)
                    }
                    NavigationLink(destination: InternalDriveExView()) {
                        Image(systemName: "externaldrive")
                        Text("Internal Storage")
                            .font(.title3)
                            .padding(.vertical, 12)
                    }
                    NavigationLink(destination: MemoryExView()) {
                        Image(systemName: "memorychip")
                        Text("RAM")
                            .font(.title3)
                            .padding(.vertical, 12)
                    }
                    NavigationLink(destination: MotherboardExView()) {
                        Image(systemName: "cable.connector.video")
                        Text("Motherboards")
                            .font(.title3)
                            .padding(.vertical, 12)
                    }
                    NavigationLink(destination: PowerSupplyExView()) {
                        Image(systemName: "power")
                        Text("Power Supplies")
                            .font(.title3)
                            .padding(.vertical, 12)
                    }
                }
                .listStyle(.plain)
            }
        }.background(readerModeEnabled ? Color.yellow.opacity(0.2) : Color.white)
            .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    ComputerPartsView()
}
