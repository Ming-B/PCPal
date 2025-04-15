import SwiftUI
import WebKit

struct MotherboardExView: View {
    @AppStorage("readerModeEnabled") private var readerModeEnabled = false
    var body: some View {
        ScrollView{
            VStack (alignment: .center, spacing: 16){
                Text("Motherboard")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.blue)
                
                HStack{
                    Text("What is a Motherboard?")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                }
                
                Text("""
            The motherboard is the central-most component to your build. While it does not contribute a ton to your computer's performance (usually), the parts you pick must fit within the specifications of your motherboard. This includes GPU size and weight, CPU type, RAM type, storage types, and case size. 
            
            The two most important parts following a motherboard choice (or in choosing a motherboard after picking some parts) are the CPU and RAM. The CPU must fit within the socket of the motherboard, and the type of RAM (DDR4 vs. DDR5) must fit within the motherboard as well. On top of this, you should not skimp out on your motherboard. Cheap motherboards are not worth the cost benefits: if one of these breaks it is a pain to rebuild your entire PC. Therefore, make sure you do adequate research before choosing a motherboard. It can truly make or break a build.
            """)
                .fixedSize(horizontal: false, vertical: true)
                
                Divider()
            
                VStack(alignment: .leading) {
                    Text("What is a motherboard")
                    YouTubePlayerView(videoID: "3zpobTv8ghA")
                        .frame(height: 200)
                    
                    Text("Choosing the right motherboard")
                    YouTubePlayerView(videoID: "fsIh2eoWLT4")
                        .frame(height: 200)
                    
                    Text("How to install a motherboard")
                    YouTubePlayerView(videoID: "XSTKVZcp5sQ")
                        .frame(height: 200)
                }
                Spacer()
            } .padding()
        }.background(readerModeEnabled ? Color.yellow.opacity(0.2) : Color.white)
            .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    MotherboardExView()
}
