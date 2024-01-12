//  PlayerOverlayView.swift Created by Tom on 2024-01-12.

import SwiftUI

struct PlayerOverlayView: View {
    
    @EnvironmentObject var videoPlayerViewModel: VideoPlayerViewModel

    var body: some View {
        HStack(spacing:10) {
            Button("BACK") {
                print("back")
            }
            .padding()
            .foregroundColor(Color(.white))
            .background(Color.blue)
            
            Button("PLAY/PAUSE") {
                print("playpause")
            }
            .padding()
            .foregroundColor(Color(.white))
            .background(Color.blue)
            
            Button("NEXT") {
                print("next")
            }
            .padding()
            .foregroundColor(Color(.white))
            .background(Color.blue)
        }
    }
}

#Preview {
    PlayerOverlayView()
}
