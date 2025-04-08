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
            VStack(alignment: .center, spacing: 10) {
                Text("Home")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                List {
                    NavigationLink(destination: GetStartedView()) {
                        Image(systemName: "play.fill")
                        Text("Get Started")
                            .font(.title3)
                            .padding(.vertical, 12)
                    }
                    NavigationLink(destination: ComputerPartsView()) {
                        Image(systemName: "cpu")
                        Text("Computer Parts")
                            .font(.title3)
                            .padding(.vertical, 12)
                    }
                    NavigationLink(destination: BuildResourcesView()) {
                        Image(systemName: "richtext.page")
                        Text("Useful Build Resources")
                            .font(.title3)
                            .padding(.vertical, 12)
                    }
                    NavigationLink(destination: OurRecommendationView()) {
                        Image(systemName: "hand.thumbsup.fill")
                        Text("Our Recommendations")
                            .font(.title3)
                            .padding(.vertical, 12)
                    }
                }
            }
        }
    }
}

#Preview {
    WelcomeScreenView()
}
