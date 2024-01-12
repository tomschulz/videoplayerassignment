//  VideoPlayerViewModel.swift  Created by Tom on 2024-01-12.
//  VideoPlayerSwiftUI
import Foundation
import AVKit

/*
  This ViewModel is responsible for loading the data from the server, and managing
  the AVPlayer. If we put the AVPlayer in the view, it will be recreated every time
  the view is redrawn, which is a bad practice. Furthermore we want the view to be as
  simple as possible, with all the complicated bits here in the VM.
 
 */

class VideoPlayerViewModel: ObservableObject {
    
    @Published var player: AVPlayer?
    @Published var showErrorAlert: Bool = false
    
    private var videos = [VideoModel]()
    private var currentVideoIndex = 0
    
    let videosURL = URL(string:"http://localhost:4000/videos")! // Force unwrapping here because I want to know right away if I have the wrong URL.
    
    init() {
        // do any necessary setup such as audiosession
    }
    
    func fetchData() {
        // get the data from the server using an async Task
        
        // once we have data, initialize the video player
    }
    
    func isVideoPlaying() -> Bool {
        return false
    }
    
    func togglePlayPause() {
        // if the video is playing pause it. If it is paused, play it.
    }
    
    func isNextButtonDisabled() -> Bool {
        return currentVideoIndex == videos.count - 1
    }
    
    func playNextVideo() {
        // update the url for the video player
    }
    
    func isPreviousButtonDisabled() {
        return currentVideoIndex = 0
    }
    
    func playPreviousVideo() {
        // update the url for the video player
    }
}
