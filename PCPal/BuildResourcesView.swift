//
//  BuildResourcesView.swift
//  PCPal
//
//  Created by Boyang Chen on 4/8/25.
//

import SwiftUI
import WebKit


struct ResourceLink: View {
    let title: String
    let url: String
    
    var body: some View {
        Link(destination: URL(string: url)!) {
            HStack {
                Image(systemName: "link")
                Text(title)
                    .font(.body)
                    .foregroundColor(.blue)
            }
        }
    }
}

struct YoutubeLink: View {
    let title: String
    let url: String
    
    var body: some View {
        Link(destination: URL(string: url)!) {
            HStack {
                Image(systemName: "video.fill")
                Text(title)
                    .font(.body)
                    .foregroundColor(.blue)
            }
        }
    }
}

struct YouTubePlayerView: UIViewRepresentable {
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView(frame: .zero, configuration: makeConfig())
        webView.scrollView.isScrollEnabled = false
        webView.isOpaque = false
        webView.backgroundColor = .clear
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let embedURL = "https://www.youtube.com/embed/\(videoID)?playsinline=1"
        if let url = URL(string: embedURL) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
    
    private func makeConfig() -> WKWebViewConfiguration {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = []
        return config
    }
}


struct BuildResourcesView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                Text("Build Resources")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.blue)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Intro to PC Building Videos")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Text("PC building guide – Linus Tech Tips")
                    YouTubePlayerView(videoID: "s1fxZ-VWs2U")
                        .frame(height: 200)
                    Text("How to Build a Powerful Gaming - optimum")
                    YouTubePlayerView(videoID: "_jjTmRPUay8")
                        .frame(height: 200)
                    Text("How to Build a PC - TechSource")
                    YouTubePlayerView(videoID: "Mho0M1Ns0Rw")
                        .frame(height: 200)
                }
                
                VStack(alignment: .center, spacing: 16) {
                    Text("For more detailed PC building tutorials, check out these YouTube channels!")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    YoutubeLink(title: "Linus Tech Tips", url: "https://www.youtube.com/user/LinusTechTips")
                    YoutubeLink(title: "JayzTwoCents", url: "https://www.youtube.com/user/Jayztwocents")
                    YoutubeLink(title: "Gamers Nexus", url: "https://www.youtube.com/user/GamersNexus")
                    YoutubeLink(title: "optimum", url: "https://www.youtube.com/@optimumtech")
                    YoutubeLink(title: "Dawid Does Tech Stuff", url: "https://www.youtube.com/@DawidDoesTechStuff")
                }
                
                VStack(alignment: .center, spacing: 16) {
                    Text("Helpful Articles and Blogs")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    ResourceLink(title: "PCPartPicker Beginner's Guide", url: "https://pcpartpicker.com/guide/")
                    ResourceLink(title: "How to Build and Set Up A PC", url: "https://artofpc.com/how-to-assemble-and-troubleshoot-pc/")
                    ResourceLink(title: "How to Build a PC - PCMag", url: "https://www.pcmag.com/how-to/how-to-build-a-pc-the-ultimate-beginners-guide")
                }
            }
            .padding()
        }
    }
}

#Preview {
    BuildResourcesView()
}
