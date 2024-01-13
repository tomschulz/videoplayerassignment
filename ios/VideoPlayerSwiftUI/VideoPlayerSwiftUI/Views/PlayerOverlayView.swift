//  PlayerOverlayView.swift Created by Tom on 2024-01-12.

import SwiftUI

struct PlayerOverlayView: View {
    
    @EnvironmentObject var videoPlayerViewModel: VideoPlayerViewModel
    
    var body: some View {
        HStack(spacing:10) {
            Button {
                videoPlayerViewModel.playPreviousVideo()
            } label: {
                Image("previous")
            }
            .padding()
            .background(Color.white)
            .clipShape(Circle())
            .disabled(videoPlayerViewModel.isPreviousButtonDisabled)
            .opacity(videoPlayerViewModel.isPreviousButtonDisabled ? 0.2 : 1.0)
            
            
            Button {
                videoPlayerViewModel.togglePlayPause()
            } label: {
                if videoPlayerViewModel.shouldShowPauseButton {
                    Image("pause")
                } else {
                    Image("play")
                }
            }
            .padding()
            .background(Color.white)
            .clipShape(Circle())
            
            Button {
                videoPlayerViewModel.playNextVideo()
            }label: {
                Image("next")
            }
            .padding()
            .background(Color.white)
            .clipShape(Circle())
            .disabled(videoPlayerViewModel.isNextButtonDisabled)
            .opacity(videoPlayerViewModel.isNextButtonDisabled ? 0.2 : 1.0)
        }
    }
}

#Preview {
    PlayerOverlayView()
}
