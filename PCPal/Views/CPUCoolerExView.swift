
import SwiftUI
import WebKit

struct CPUCoolerExView: View {
    var body: some View {
        ScrollView{
            VStack (alignment: .center, spacing: 16){
                Text("CPU Cooler")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.blue)
                
                HStack{
                    Text("What is a CPU Cooler?")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                }
                
                Text("""
            The CPU cooler, while not directly contributing to the computer's specs, is vitally important to the computer's longevity, processing speed, and overall performance. The CPU cooler is installed directly on top of the CPU via a bracket attached to the motherboard. The CPU cooler will help with keeping the CPU from overheating while processing. Many of the most powerful CPUs run at speeds that generate a lot of heat. When the CPU starts to overheat, the speeds at which it can process instructions drop dramatically. Therefore, it is important to choose a CPU cooler that will keep the CPU from overheating.
            
            Additionally, there are some other guidelines to follow when choosing a cooler. One is to ensure that you get thermal paste to install between the CPU and CPU Cooler. If you do not use this, the CPU will still overheat and your cooler is essentially useless. On top of this, make sure you choose a CPU cooler that fits inside your case. If you choose a massive cooler and choose to go with a micro ITX case, your cooler is highly unlikely to fit.
            """)
                .fixedSize(horizontal: false, vertical: true)
                
                Divider()
            
                VStack(alignment: .leading) {
                    Text("Choosing a CPU Cooler")
                    YouTubePlayerView(videoID: "7f-Guxj4kl0")
                        .frame(height: 200)
                    
                    Text("How to install a CPU Cooler")
                    YouTubePlayerView(videoID: "hJ0I1XlFWno")
                        .frame(height: 200)
                }
                Spacer()
            } .padding()
        }
    }
}

#Preview {
    CPUCoolerExView()
}
