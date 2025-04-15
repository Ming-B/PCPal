//
//  StorageView.swift
//  PCPal
//
//  Created by Boyang Chen on 4/14/25.
//

import SwiftUI
import SwiftData

struct StorageView: View {
    @State var storages: [Storage]
    @Query var carts: [Cart]
    @Environment(\.modelContext) private var modelContext

    @State private var selectedStorageName: String = ""

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

    func updateStorage(storage: Storage) {
        cart.harddrive = storage
        try? modelContext.save()
    }

    var body: some View {
        VStack {
            List {
                HStack {
                    if let storage = cart.harddrive {
                        VStack(alignment: .leading) {
                            Text(storage.name)
                            if let price = storage.price {
                                Text("Price - $\(price, specifier: "%.2f")")
                            }
                            if let capacity = storage.capacity {
                                Text("Capacity - \(capacity, specifier: "%.0f") GB")
                            }
                            if let price_per_gb = storage.price_per_gb {
                                Text("Price/GB - \(price_per_gb, specifier: "%.0f") GB")
                            }
                            if let cache = storage.cache {
                                Text("Cache - \(cache)")
                            }
                            if let interface = storage.interface {
                                Text("Interface - \(interface)")
                            }
                        }
                    } else {
                        Text("No Storage In Cart")
                            .foregroundColor(.gray)
                    }
                }

                Picker("Select Storage", selection: $selectedStorageName) {
                    ForEach(storages, id: \.name) { storage in
                        Text(storage.name).tag(storage.name)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
        }
        .onAppear {
            if let savedStorage = cart.harddrive {
                selectedStorageName = savedStorage.name
                print(savedStorage)
            }
        }
        .onChange(of: selectedStorageName) { newName in
            if let newStorage = storages.first(where: { $0.name == newName }) {
                updateStorage(storage: newStorage)
            }
        }
    }
}

#Preview {
    StorageView(storages: loadStorage(filename: "internal-hard-drive") ?? [])
}

