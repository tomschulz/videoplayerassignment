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
    @Published var errorMessage: String = ""
    
    private var videos = [VideoModel]()
    private var currentVideoIndex = 0
    
    let videosURL = URL(string:"http://localhost:4000/videos")! // Force unwrapping here because I want to know right away if I have the wrong URL.
    
    init() {
        // do any necessary setup such as audiosession
    }
    
    func fetchData() {
        Task {
            do {
                let (data, response) = try await URLSession.shared.data(from: videosURL)
                videos = try JSONDecoder().decode([VideoModel].self, from: data)
                
                print("We have videos!")
                
                for V in videos {
                    print("VIDEO: \(V.hlsURL)")
                }
            } catch {
                videos = []
                errorMessage = "Failed to download videos"
                showErrorAlert = true
                print("Error fetching data: \(error.localizedDescription)")
            }
        }
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
