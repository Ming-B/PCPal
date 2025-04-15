import SwiftUI
import WebKit

struct MemoryExView: View {
    @AppStorage("readerModeEnabled") private var readerModeEnabled = false
    var body: some View {
        ScrollView{
            VStack (alignment: .center, spacing: 16){
                Text("Memory (RAM)")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.blue)
                
                HStack{
                    Text("What is RAM?")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                }
                
                Text("""
            RAM, which stands for Random Access Memory, is the primary source of fast memory in your system. It holds short-term data to give to the CPU, which mainly includes instructions and commonly accessed memory. This allows the processor to work efficiently. 
            
            Choosing the right RAM for your system is vitally important. Based on your processor and motherboard, you may need to chose between DDR4 and DDR5 or other form factors. Therefore, make sure to check what is needed for your system before buying.
            
            On top of this, not all RAM is made the same. Here is why some RAM components might be better than others:
            
            **Capacity**- Measured in GBs, this is how much memory you can hold. More capacity is typically better, but is often more expensive or might run into latency issues
            
            **Frequency**- Measured in mHz, this is how quickly your memory operates. A higher frequency is better.
            
            **Channels**- This is how many sticks of RAM you buy. A single stick does not take advantage of something called 'dual-channel memory,' which aids in speeding up processes on your computer. If you are unsure of what type of memory you want, opt for dual-channel memory.
            
            **CAS-Latency**- Similar to a monitor, this is the response time it takes for the memory to give instructions to your CPU. A lower latency is better.
            """)
                .fixedSize(horizontal: false, vertical: true)
                
                Divider()
            
                VStack(alignment: .leading) {
                    Text("How to choose the right RAM")
                    YouTubePlayerView(videoID: "OGr1UEMt2Io")
                        .frame(height: 200)
                    
                    Text("How to change your RAM (installation)")
                    YouTubePlayerView(videoID: "RdukEtSlia0")
                        .frame(height: 200)
                }
                Spacer()
            } .padding()
        }.background(readerModeEnabled ? Color.yellow.opacity(0.2) : Color.white)
            .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    MemoryExView()
}
