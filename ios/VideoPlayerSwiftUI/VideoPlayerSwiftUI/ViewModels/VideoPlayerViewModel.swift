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

@MainActor
class VideoPlayerViewModel: ObservableObject {
    
    @Published var player: AVPlayer?
    @Published var showErrorAlert: Bool = false
    @Published var errorMessage: String = ""
    
    @Published var isNextButtonDisabled: Bool = true
    @Published var isPreviousButtonDisabled: Bool = true
    
    @Published var shouldHideOver = false
    
    private var videos = [VideoModel]()
    private var currentVideoIndex = 0
    
    let videosURL = URL(string:"http://localhost:4000/videos")! // Force unwrapping here because I want to know right away if I have the wrong URL.
    
    init() {
        // do any necessary setup such as audiosession
    }
    
    func fetchData() {
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: videosURL)
                videos = try JSONDecoder().decode([VideoModel].self, from: data)
                currentVideoIndex = 0
                createPlayer()
                updateNextPreviousButtonStates()
            } catch {
                videos = []
                errorMessage = "Failed to download videos"
                showErrorAlert = true
                print("Error fetching data: \(error.localizedDescription)")
            }
        }
    }
    
    func createPlayer() {
        guard let streamingURL = URL(string:videos[currentVideoIndex].hlsURL) else {
            showBadVideoURLError()
            return
        }
        player = AVPlayer(url: streamingURL)
    }
    
    // sets up the alert if we have a bad URL in the data
    func showBadVideoURLError() {
        errorMessage = "Malformed url for video"
        showErrorAlert = true
        player = nil
    }
    
    func getCurrentVideoModel() -> VideoModel? {
        guard currentVideoIndex < videos.count else {
            print("current index out of range")
            return nil
        }
        return videos[currentVideoIndex]
    }
    
    func isVideoPlaying() -> Bool {
        guard let videoPlayer = player else {
            return false
        }
        return videoPlayer.timeControlStatus == .playing
    }
    
    func togglePlayPause() {
        guard let videoPlayer = player else {
            return
        }
        if isVideoPlaying() {
            videoPlayer.pause()
        } else {
            videoPlayer.play()
        }
    }

    func playNextVideo() {
        guard currentVideoIndex < (videos.count - 1) else {
            return
        }
        guard let streamURL =  URL(string: videos[currentVideoIndex+1].hlsURL) else {
            showBadVideoURLError()
            return
        }
        currentVideoIndex = currentVideoIndex + 1
        updateNextPreviousButtonStates()
        player?.replaceCurrentItem(with: AVPlayerItem(url: streamURL))
    }
        
    func playPreviousVideo() {
        guard currentVideoIndex > 0 else {
            return
        }
        guard let streamURL =  URL(string: videos[currentVideoIndex-1].hlsURL) else {
            showBadVideoURLError()
            return
        }
        currentVideoIndex = currentVideoIndex - 1
        updateNextPreviousButtonStates()
        player?.replaceCurrentItem(with: AVPlayerItem(url: streamURL))
    }
    
    func updateNextPreviousButtonStates() {
        if currentVideoIndex == 0 {
            isPreviousButtonDisabled = true
        } else {
            isPreviousButtonDisabled = false
        }
        
        if currentVideoIndex < (videos.count - 1){
            isNextButtonDisabled = false
        } else {
            isNextButtonDisabled = true
        }
    }
    
}
