//
//  ContentView.swift
//  VideoPlayerSwiftUI
//
//  Created by Michael Gauthier on 2021-01-06.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var videoPlayerViewModel: VideoPlayerViewModel
    
    let screenWidth = UIScreen.main.bounds.width
    let titleHeight = 64.0
    let aspect16to9 = 9.0 / 16.0
    
    var body: some View {
        VStack {
            Text("TITLE")
                .fontWeight(.bold)
                .frame(width: screenWidth, height: titleHeight)
                .foregroundColor(.white)
                .background(Color.black)
                
            Group {
                Text("Player Goes Here")
            }
            .frame(width: screenWidth, height: screenWidth * aspect16to9)
            
            Divider()
            
            ScrollView {
                VideoDetailsView()
            }
            .frame(width: screenWidth)
            .frame(maxHeight: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
