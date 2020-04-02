//
//  PodcastPlayerView.swift
//  SwiftUI_Example
//
//  Created by VALERIYA on 02.04.2020.
//  Copyright © 2020 VALERIYA. All rights reserved.
//

import SwiftUI

struct PodcastPlayerView: View {
    @EnvironmentObject var player: PodcastPlayer
    @ObservedObject var viewModel: PodcastViewModel
    
    var body: some View {
        NavigationView {
            Button(
                action: {
                    if self.player.isPlaying {
                        self.player.pause()
                    } else {
                        self.player.play()
                    }
            }, label: {
                    Text(player.isPlaying ? "Pause": "Play")
                }
            )
            .navigationBarTitle(Text("Podcasts"), displayMode: .inline)
            .navigationBarItems(leading: Button(action: viewModel.backAction) {
                Text("Назад")
            })
        }
    }
}

struct PodcastPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PodcastPlayerView(viewModel: .init())
    }
}
