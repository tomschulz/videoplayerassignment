//  ContentView.swift Created by Tom Schulz Created by Michael Gauthier on 2021-01-06.
import SwiftUI
import AVKit
struct ContentView: View {
    
    @EnvironmentObject var videoPlayerViewModel: VideoPlayerViewModel
    
    let screenWidth = UIScreen.main.bounds.width
    let titleHeight = 64.0
    let aspect16to9 = 9.0 / 16.0
    
    var body: some View {
        VStack(spacing:0) {
            Text("TITLE")
                .fontWeight(.bold)
                .frame(width: screenWidth, height: titleHeight)
                .foregroundColor(.white)
                .background(Color.black)
                
            Group {
                if let player = videoPlayerViewModel.player {
                    VideoPlayer(player: player)
                } else {
                    EmptyView()
                }
            }
            .frame(width: screenWidth, height: screenWidth * aspect16to9)
            .border(Color.red)
            
            Divider()
            
            ScrollView {
                VideoDetailsView()
            }
            .frame(width: screenWidth)
            .frame(maxHeight: .infinity)
        }
        .onAppear {
            videoPlayerViewModel.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
