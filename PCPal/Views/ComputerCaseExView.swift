import SwiftUI
import WebKit

struct ComputerCaseExView: View {
    @AppStorage("readerModeEnabled") private var readerModeEnabled = false
    var body: some View {
        ScrollView{
            VStack (alignment: .center, spacing: 16){
                Text("Computer Cases")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.blue)
                
                HStack{
                    Text("What are Computer Cases?")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                }
                
                Text("""
            The Computer Case is probably the most intuitive part of the build. However, there are some catches and snags to look out for when choosing the correct computer case.
            
            The first catch is ensuring you buy the right case size. Computer parts come in all shapes and sizes. From full tower to nano ITX, only certain computer parts, and importantly motherboards, will fit within your case. Therefore, it is vitally important to pick a case that will fit all of your components without overcrowding them. A case that is too small won't fit your parts or will overheat due to a lack of airflow. A case that is too large might be too spaced out to attach the cables properly.
            
            A second place to look out for is cases that don't include fans. While it is recommended overall to get after-market fans in order to have better airflow through your computer, having basic fans that come with the case can be a great entry-level option. Therefore, picking a case that has a couple fans already included can be a great benefit to your build.
            
            Finally, ensure you pick a case that isn't ripping you off. Some cases are really nice to look at it, but the most important aspec of building a PC is ensuring that it works. So picking a case that has the right parts, size, included extras, and price is vitally important.
            """)
                .fixedSize(horizontal: false, vertical: true)
                
                Divider()
            
                VStack(alignment: .leading) {
                    Text("Choosing the Right Computer Case")
                    YouTubePlayerView(videoID: "vhyqtZx0NHM")
                        .frame(height: 200)
                }
                Spacer()
            } .padding()
        }.background(readerModeEnabled ? Color.yellow.opacity(0.2) : Color.white)
            .ignoresSafeArea(.keyboard)
    }
}


#Preview {
    ComputerCaseExView()
}
