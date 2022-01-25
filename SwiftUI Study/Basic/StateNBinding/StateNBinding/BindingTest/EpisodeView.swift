//
//  EpisodeView.swift
//  StateNBinding
//
//  Created by 장희선 on 2022/01/25.
//

import SwiftUI

struct EpisodeView: View {
    
    let episode = Episode(name: "neoguri", track: "WWDC 2022")
    
    @State private var isPlaying = false
    
    var body: some View {
        VStack {
            Text(episode.name)
                .font(.title)
                .foregroundColor(isPlaying ? .green : .black)
            Text(episode.track)
                .foregroundColor(.secondary)
            
            PlayButton(isPlaying: $isPlaying)
        }
    }
}

struct PlayButton: View {
    
    @SwiftUI.Binding var isPlaying: Bool
    
    var body: some View {
        Button(
            action: {
                self.isPlaying.toggle()
            },
            label: {
                Text("Play")
            })
            .padding(12)
    }
}

struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeView()
    }
}
