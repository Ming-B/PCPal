import SwiftUI
import WebKit

struct PowerSupplyExView: View {    @AppStorage("readerModeEnabled") private var readerModeEnabled = false
    var body: some View {
        ScrollView{
            VStack (alignment: .center, spacing: 16){
                Text("Power Supply")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.blue)
                
                HStack{
                    Text("What is a Power Supply?")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                }
                
                Text("""
            The Power Supply Unit, or the PSU, is the component that gives all of your parts power. PSUs come in different shapes and sizes: some are large and some are small. Some allow for full modularity (the removal of excess cables), and some allow for no modularity. Some come with upgraded, wrapped caples, and some come in "ketchup and mustard" wires. The aesthetics are up to you, but ensure that the right cables for your build arrive.
            
            However, there are two very important parts of a power supply. The first is whether or not it is 80 PLUS or cybernetics certified. These are a group of standards that ensure you are not wasting energy powering your computer (causing your electricty bill to skyrocket). The other important part is the wattage of your power supply. It's important to ensure enough power to your device to use the parts you have chosen.
            
            Finally, ensure that the power supply you pick fits within your case. This is an often overlooked step, but if you choose to go with a smaller build (think ITX), then you might need to consider the size of your PSU.
            """)
                .fixedSize(horizontal: false, vertical: true)
                
                Divider()
            
                VStack(alignment: .leading) {
                    Text("What is a power supply")
                    YouTubePlayerView(videoID: "TcAtFpuREDw")
                        .frame(height: 200)
                    
                    Text("Choosing the right power supply")
                    YouTubePlayerView(videoID: "SS7P63fLE_8")
                        .frame(height: 200)
                    
                    Text("How to install a power supply")
                    YouTubePlayerView(videoID: "eMwy7QSySQo")
                        .frame(height: 200)
                }
                Spacer()
            } .padding()
        }.background(readerModeEnabled ? Color.yellow.opacity(0.2) : Color.white)
            .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    PowerSupplyExView()
}
