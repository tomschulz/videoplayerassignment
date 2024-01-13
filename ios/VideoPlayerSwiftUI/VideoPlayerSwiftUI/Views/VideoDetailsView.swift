//  VideoDetailsView.swift Created by Tom on 2024-01-12.
import SwiftUI
import MarkdownKit

struct VideoDetailsView: View {
    
    @EnvironmentObject var videoPlayerViewModel: VideoPlayerViewModel

    func getMarkdownStringForDescription() -> AttributedString {
        let markdownParser = MarkdownParser()
        if let markdown = videoPlayerViewModel.getCurrentVideoModel()?.description {
            return  AttributedString(markdownParser.parse(markdown))
        } else {
            return AttributedString(markdownParser.parse(""))
        }
    }
    
    var body: some View {
        
        if let currentVideo = videoPlayerViewModel.getCurrentVideoModel() {
            ScrollView {
                VStack(alignment: .leading, spacing: 10.0) {
                    Text(currentVideo.title)
                        .font(.headline)
                    Text(currentVideo.author.name)
                        .font(.subheadline)

                    Text(getMarkdownStringForDescription())
    
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
