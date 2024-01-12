//
//  VideoDetailsView.swift
//  VideoPlayerSwiftUI
//
//  Created by Tom on 2024-01-12.
//

import SwiftUI

struct VideoDetailsView: View {
    
    @EnvironmentObject var videoPlayerViewModel: VideoPlayerViewModel

    var body: some View {
        
        if let currentVideo = videoPlayerViewModel.getCurrentVideoModel() {
            ScrollView {
                VStack(alignment: .leading, spacing: 10.0) {
                    Text(currentVideo.title)
                        .font(.title)
                    Text(currentVideo.author.name)
                        .font(.subheadline)
                    Text(currentVideo.description)
                }
            }
        } else {
            EmptyView()
        }
    }
}

#Preview {
    VideoDetailsView()
}
