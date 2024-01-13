//  AVPlayerViewController+DisableControls.swift  Created by Tom on 2024-01-12.
import Foundation
import AVKit

// I found this solution on the Apple developer forums
// https://forums.developer.apple.com/forums/thread/654378

extension AVPlayerViewController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.showsPlaybackControls = false
    }
}
