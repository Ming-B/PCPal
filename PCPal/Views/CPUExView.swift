
import SwiftUI
import WebKit

struct CPUExView: View {
    var body: some View {
        ScrollView{
            VStack (alignment: .center, spacing: 16){
                Text("CPU")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.blue)
                
                HStack{
                    Text("What is a CPU?")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                }
                
                Text("""
            The Central Processing Unit (CPU) of your computer is the main brains behind any actions your computer takes throughout the day. It reads the computer's instructions (typically stored in memory like RAM) and allocates resources to ensure quick and efficient execution.
                
            Having an efficient CPU is critical for your PC to run at optimal levels. There are many benchmarks that make a CPU more efficient, however, the most imporant markers are: 
                
            **Clock Speed (GHz)**- How many instructions the computer can process per second. Higher is better
            **Core Count**- Allows the CPU to handle tasks simultaneously more efficiently. Higher is better
            **Cache**- Ultra-fast memory storage. A larger cache is typically better
                        
            An important thing to note about the CPU is there are an incredible number of highly sensitive pins underneath the CPU casing that connect to the motherboard socket. These pins, if bent, can completely break the CPU. Thus, it is imporant to be careful when installing the CPU.
            """)
                .fixedSize(horizontal: false, vertical: true)
                
                Divider()
            
                VStack(alignment: .leading) {
                    Text("What is a CPU?")
                    YouTubePlayerView(videoID: "f-Tu7OLK3fY")
                        .frame(height: 200)
                    
                    Text("How to install a CPU")
                    YouTubePlayerView(videoID: "_zojIW-2DD8")
                        .frame(height: 200)
                }
                Spacer()
            } .padding()
        }
    }
}

#Preview {
    CPUExView()
}
