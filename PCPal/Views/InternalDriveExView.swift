import SwiftUI
import WebKit

struct InternalDriveExView: View {
    @AppStorage("readerModeEnabled") private var readerModeEnabled = false
    var body: some View {
        ScrollView{
            VStack (alignment: .center, spacing: 16){
                Text("Storage")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.blue)
                
                HStack{
                    Text("What is Internal Storage?")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                }
                
                Text("""
            Internal Storage is vitally important for the installation of programs, operating systems, or any other data necessary to the User's experience. Internal storage is slower than RAM or cache memory, but is much larger. Most modern PC's opt for 512 GBs, 1 TB, or larger storage.
            
            Storage comes mainly in two different flavors. Hard Drives, typically denoted as HDD, are typically a slower version of storage. However, they are considerably larger than other faster storage and much cheaper. Solid State Storage, typically denoted as SSD, are usually smaller than their HDD counterparts and cost more. However, SSDs are typically much faster, including modern M.2 drives that are usually regarded as the quickest large storage that a novice PC builer should concern themselves with.
            """)
                .fixedSize(horizontal: false, vertical: true)
                
                Divider()
            
                VStack(alignment: .leading) {
                    Text("Storage + Installation Guide")
                    YouTubePlayerView(videoID: "jkl8a94IgpE")
                        .frame(height: 200)
                }
                Spacer()
            } .padding()
        }.background(readerModeEnabled ? Color.yellow.opacity(0.2) : Color.white)
            .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    InternalDriveExView()
}
