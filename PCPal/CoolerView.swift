//
//  CoolerView.swift
//  PCPal
//
//  Created by Boyang Chen on 4/14/25.
//

import SwiftUI
import SwiftData

struct CoolerView: View {
    @State var coolers: [CPUCooler]
    @Query var carts: [Cart]
    @Environment(\.modelContext) private var modelContext

    @State private var selectedCoolerName: String = ""

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

    func updateCooler(cooler: CPUCooler) {
        cart.cooler = cooler
        try? modelContext.save()
    }

    var body: some View {
        VStack {
            List {
                HStack {
                    if let cooler = cart.cooler {
                        VStack(alignment: .leading) {
                            Text(cooler.name)
                            if let price = cooler.price {
                                Text("Price - $\(price, specifier: "%.2f")")
                            }
                            if let rpm = cooler.rpm {
                                switch rpm {
                                case .int(let value):
                                    Text("Fan RPM - \(value, specifier: "%.0f")")
                                case .array(let values):
                                    Text("Fan RPMs - \(values.map { String($0) }.joined(separator: ", "))")
                                }
                            }
                        }
                    } else {
                        Text("No Cooler In Cart")
                            .foregroundColor(.gray)
                    }
                }

                Picker("Select Cooler", selection: $selectedCoolerName) {
                    ForEach(coolers, id: \.name) { cooler in
                        Text(cooler.name).tag(cooler.name)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
        }
        .onAppear {
            if let savedCooler = cart.cooler {
                selectedCoolerName = savedCooler.name
                print(savedCooler)
            }
        }
        .onChange(of: selectedCoolerName) { newName in
            if let newCooler = coolers.first(where: { $0.name == newName }) {
                updateCooler(cooler: newCooler)
            }
        }
    }
}

#Preview {
    CoolerView(coolers: loadCooler(filename: "cpu-cooler") ?? [])
}
