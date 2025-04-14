//
//  PCPalApp.swift
//  PCPal
//
//  Created by Ming Bian on 4/6/25.
//

import SwiftUI
import SwiftData

@main
struct PCPalApp: App {
    var body: some Scene {
        WindowGroup {
            CartView()
        }
        .modelContainer(for: Cart.self)
    }
}
