//
//  MotherboardView.swift
//  PCPal
//
//  Created by Sam King on 4/12/25.
//

import SwiftUI
import SwiftData

struct MotherboardView: View {
    @State var Motherboards: [Motherboard]
    @Query var carts: [Cart]
    @Environment(\.modelContext) private var modelContext
    
    @State private var selectedMotherboardName: String = ""
    
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
    
    func updateMotherboard(motherboard: Motherboard) {
        cart.motherboard = motherboard
        try? modelContext.save()
    }
    
    var body: some View {
        VStack {
            List {
                HStack {
                    if let motherboard = cart.motherboard {
                        VStack(alignment: .leading) {
                            Text(motherboard.name)
                            if let price = motherboard.price {
                                Text("Price - $\(price, specifier: "%.2f")")
                            }
                        }
                    } else {
                        Text("No Motherboard In Cart")
                            .foregroundColor(.gray)
                    }
                }
                
                Picker("Select Motherboard", selection: $selectedMotherboardName) {
                    ForEach(Motherboards, id: \.name) { motherboard in
                        Text(motherboard.name).tag(motherboard.name)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
        }
        .onAppear {
            if let savedMotherboard = cart.motherboard {
                selectedMotherboardName = savedMotherboard.name
                print(savedMotherboard)
            }
        }
        .onChange(of: selectedMotherboardName) { newName in
            if let newMotherboard = Motherboards.first(where: { $0.name == newName }) {
                updateMotherboard(motherboard: newMotherboard)
            }
        }
    }
}

#Preview {
    MotherboardView(Motherboards:  loadMotherboard(filename: "motherboard") ?? [])
}

