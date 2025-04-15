import SwiftUI
import SwiftData


struct WelcomeScreenView: View {
    @AppStorage("readerModeEnabled") private var readerModeEnabled = false
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomLeading) {
                VStack(alignment: .center, spacing: 10) {
                    Text("Home")
                        .font(.largeTitle.bold())
                        .foregroundStyle(readerModeEnabled ? .black : .blue)
                    
                    List {
                        NavigationLink(destination: GetStartedView()) {
                            Image(systemName: "play.fill")
                            Text("Getting Started")
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
                        NavigationLink(destination: CartView()) {
                            Image(systemName: "laptopcomputer")
                            Text("PC Part Picker")
                                .font(.title3)
                                .padding(.vertical, 12)
                        }
                    }
                    .listStyle(.plain)
                    .background(readerModeEnabled ? Color(.systemGray6) : Color.clear)
                }
                HStack {
                    Text("Stylish Mode")
                        .font(.headline)
                        .foregroundColor(.gray)
                    Toggle("", isOn: $readerModeEnabled)
                        .labelsHidden()
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                    
                    Spacer()
                }
                .padding()
            }.background(readerModeEnabled ? Color.yellow.opacity(0.2) : Color.white)
            .ignoresSafeArea(.keyboard)
        }
    }
}

#Preview {
    WelcomeScreenView()
}
