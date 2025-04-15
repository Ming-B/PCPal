import SwiftUI
import WebKit

struct GPUExView: View {
    var body: some View {
        ScrollView{
            VStack (alignment: .center, spacing: 16){
                Text("GPU")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.blue)
                
                HStack{
                    Text("What is a GPU?")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                }
                
                Text("""
            The Graphics Processing Unit, or GPU, is the component that contributes to video and image rendering of the computer. While it is possible to have integrated graphics on your CPU (which is enough for some uses, such as office use or processor-heavy machines), the graphics card is incredibly important for tasks such as video editing, rendering, and gaming. Especially in gaming, users are typically looking for the highest framerates available.
            
            The graphics card can quickly become one of the most expensive parts of the PC, so choosing an optimal graphics card for your needs is vitally imporant if your aim is remaining in a budget. Here are some important components to look at for graphics cards:
            
            **Clock Speed**- The higher the clock speed, the more data per second the GPU can process
            
            **Core Count**- The more cors the GPU has, the more complex tasks it can complete
            
            **Memory (VRAM)**- The more memory the GPU has, the more it can store (think models, images, etc.) in order to more efficiently load data
            
            **Power Consumption**- While not directly contributing to overall performance, it is important to not have a graphics card that overdraws on power consumption, as this can raise your energy bill or overload your power supply
            
            
            """)
                .fixedSize(horizontal: false, vertical: true)
                
                Divider()
            
                VStack(alignment: .leading) {
                    Text("Choosing a GPU")
                    YouTubePlayerView(videoID: "8hyWXJe_wts")
                        .frame(height: 200)
                    
                    Text("How to install a GPU")
                    YouTubePlayerView(videoID: "nyDxrTHDjXQ")
                        .frame(height: 200)
                }
                Spacer()
            } .padding()
        }
    }
}
#Preview {
    GPUExView()
}
