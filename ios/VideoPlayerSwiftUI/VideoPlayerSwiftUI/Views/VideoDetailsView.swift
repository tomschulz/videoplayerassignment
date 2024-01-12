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
        ScrollView {
            VStack(alignment: .leading, spacing: 10.0) {
                Text("Title")
                    .font(.title)
                Text("Author")
                    .font(.subheadline)
                Text("This is a long multiline text rabbit This is a long multiline text applesauce This is a long multiline text while martin scorcese may have won an oscar for the departed it is certainly not his best movie this is a long multiline text lets make it big so we can make sure it scrolls this is a long multiline text This is a long multiline text rabbit This is a long multiline text applesauce This is a long multiline text while martin scorcese may have won an oscar for the departed it is certainly not his best movie this is a long multiline text lets make it big so we can make sure it scrolls this is a long multiline text")
                    .font(.title)
            }
        }
    }
}

#Preview {
    VideoDetailsView()
}
