//
//  WelcomeScreenView.swift
//  PCPal
//
//  Created by Boyang Chen on 4/8/25.
//

import SwiftUI

struct WelcomeScreenView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: Text("View 1")) {
                                    Text("Get Started")
                                }
            }
        }
    }
}

#Preview {
    WelcomeScreenView()
}
