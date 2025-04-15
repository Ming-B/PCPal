//
//  ComputerCaseView.swift
//  PCPal
//
//  Created by Sam King on 4/12/25.
//

import SwiftUI
import SwiftData

struct ComputerCaseView: View {
    @State var ComputerCases: [ComputerCase]
    @Query var carts: [Cart]
    @Environment(\.modelContext) private var modelContext

    @State private var selectedComputerCaseName: String = ""

    var cart: Cart {
        if let existingCart = carts.first {
            return existingCart
        } else {
            let newCart = Cart()
            modelContext.insert(newCart)
            try? modelContext.save()
            return newCart
        }
    }

    func updateComputerCase(computercase: ComputerCase) {
        cart.computercase = computercase
        try? modelContext.save()
    }

    var body: some View {
        VStack {
            List {
                HStack {
                    if let computercase = cart.computercase {
                        VStack(alignment: .leading) {
                            Text(computercase.name)
                            if let color = computercase.color {
                                Text("Color - \(color)")
                            }
                            if let psu = computercase.psu {
                                Text("PSU - $\(psu, specifier: "%.2f")")
                            }
                            if let side_panel = computercase.side_panel {
                                Text("Side Panel - \(side_panel)")
                            }
                            if let external_volume = computercase.external_volume {
                                Text("External Volume - $\(external_volume, specifier: "%.2f")")
                            }
                            if let internal_35_bays = computercase.internal_35_bays {
                                Text("Internal Bays - $\(internal_35_bays, specifier: "%.2f")")
                            }
                        }
                    } else {
                        Text("No Computer Case In Cart")
                            .foregroundColor(.gray)
                    }
                }

                Picker("Select Computer Case", selection: $selectedComputerCaseName) {
                    ForEach(ComputerCases, id: \.name) { computercase in
                        Text(computercase.name).tag(computercase.name)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
        }
        .onAppear {
            if let savedComputerCase = cart.computercase {
                selectedComputerCaseName = savedComputerCase.name
                print(savedComputerCase)
            }
        }
        .onChange(of: selectedComputerCaseName) { oldValue, newName in
            if let newComputerCase = ComputerCases.first(where: { $0.name == newName }) {
                updateComputerCase(computercase: newComputerCase)
            }
        }
    }
}

#Preview {
    ComputerCaseView(ComputerCases: loadCase(filename: "case") ?? [])
}

