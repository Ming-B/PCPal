//
//  PowerSupplyView.swift
//  PCPal
//
//  Created by Boyang Chen on 4/14/25.
//

import SwiftUI
import SwiftData

struct PowerSupplyView: View {
    @State var PSUS: [PSU]
    @Query var carts: [Cart]
    @Environment(\.modelContext) private var modelContext

    @State private var selectedPSUName: String = ""

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

    func updatePSU(psu: PSU) {
        cart.powersupply = psu
        try? modelContext.save()
    }

    var body: some View {
        VStack {
            List {
                HStack {
                    if let psu = cart.powersupply {
                        VStack(alignment: .leading) {
                            Text(psu.name)
                            if let price = psu.price {
                                Text("Price - $\(price, specifier: "%.2f")")
                            }
                        }
                    } else {
                        Text("No Power Supply In Cart")
                            .foregroundColor(.gray)
                    }
                }

                Picker("Select Power Supply", selection: $selectedPSUName) {
                    ForEach(PSUS, id: \.name) { psu in
                        Text(psu.name).tag(psu.name)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
        }
        .onAppear {
            if let savedPSU = cart.powersupply {
                selectedPSUName = savedPSU.name
                print(savedPSU)
            }
        }
        .onChange(of: selectedPSUName) { newName in
            if let newPSU = PSUS.first(where: { $0.name == newName }) {
                updatePSU(psu: newPSU)
            }
        }
    }
}

#Preview {
    PowerSupplyView(PSUS: loadPSU(filename: "power-supply") ?? [])
}
