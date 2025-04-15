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
    @AppStorage("readerModeEnabled") private var readerModeEnabled = false
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
            Text("Computer Cooler")
                .font(.title)
                .foregroundColor(Color.blue)
                .padding()
            List {
                HStack {
                    if let cooler = cart.cooler {
                        VStack(alignment: .leading) {
                            Text(cooler.name)
                            if let price = cooler.price {
                                Text("Price - $\(price, specifier: "%.2f")")
                            }
                            if let boost_clock = cooler.boost_clock {
                                Text("Boost Clock - $\(boost_clock, specifier: "%.2f")")
                            }
                            if let graphics = cooler.graphics {
                                Text("Graphics - \(graphics)")
                            }
                            if let smt = cooler.smt {
                                Text("SMT - \(smt)")
                            }
                        }
                    } else {
                        Text("No Cooler In Cart")
                            .foregroundColor(.gray)
                    }
                }

                Picker("Select Cooler", selection: $selectedCoolerName) {
                    Text("").tag("")
                    ForEach(coolers, id: \.id) { cooler in
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
        .onChange(of: selectedCoolerName) { oldValue, newName in
            if let newCooler = coolers.first(where: { $0.name == newName }) {
                updateCooler(cooler: newCooler)
            }
        }.background(readerModeEnabled ? Color.yellow.opacity(0.2) : Color.white)
            .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    CoolerView(coolers: loadCooler(filename: "cpu-cooler") ?? [])
}
