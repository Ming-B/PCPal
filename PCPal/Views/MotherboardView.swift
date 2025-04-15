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
    
    func updateMotherboard(motherboard: Motherboard) {
        cart.motherboard = motherboard
        try? modelContext.save()
    }
    
    var body: some View {
        VStack {
            Text("Computer Motherboard")
                .font(.title)
                .foregroundColor(Color.blue)
                .padding()
            List {
                HStack {
                    if let motherboard = cart.motherboard {
                        VStack(alignment: .leading) {
                            Text(motherboard.name)
                            if let price = motherboard.price {
                                Text("Price - $\(price, specifier: "%.2f")")
                            }
                            if let socket = motherboard.socket {
                                Text("Socket - \(socket)")
                            }
                            if let form_factor = motherboard.form_factor {
                                Text("Form Factor - \(form_factor)")
                            }
                            if let max_memory = motherboard.max_memory {
                                Text("Max Memory - \(max_memory)")
                            }
                            if let color = motherboard.color {
                                Text("Color - \(color)")
                            }
                        }
                    } else {
                        Text("No Motherboard In Cart")
                            .foregroundColor(.gray)
                    }
                }
                
                Picker("Select Motherboard", selection: $selectedMotherboardName) {
                    Text("").tag("")

                    ForEach(Motherboards, id: \.id) { motherboard in
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
        .onChange(of: selectedMotherboardName) { oldValue, newName in
            if let newMotherboard = Motherboards.first(where: { $0.name == newName }) {
                updateMotherboard(motherboard: newMotherboard)
            }
        }.background(readerModeEnabled ? Color.yellow.opacity(0.2) : Color.white)
            .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    MotherboardView(Motherboards:  loadMotherboard(filename: "motherboard") ?? [])
}

