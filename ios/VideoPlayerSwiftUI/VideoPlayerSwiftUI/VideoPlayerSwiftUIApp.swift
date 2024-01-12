//
//  VideoPlayerSwiftUIApp.swift
//  VideoPlayerSwiftUI
//
//  Created by Michael Gauthier on 2021-01-06.
//

import SwiftUI

@main
struct VideoPlayerSwiftUIApp: App {
    
    @StateObject var videoPlayerViewModel = VideoPlayerViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(videoPlayerViewModel)
        }
    }
}
