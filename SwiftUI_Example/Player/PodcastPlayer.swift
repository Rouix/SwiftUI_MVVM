//
//  PodcastPlayer.swift
//  SwiftUI_Example
//
//  Created by VALERIYA on 02.04.2020.
//  Copyright © 2020 VALERIYA. All rights reserved.
//

import Foundation

final class PodcastPlayer: ObservableObject {
    @Published private(set) var isPlaying: Bool = false

    func play() {
        isPlaying = true
    }

    func pause() {
        isPlaying = false
    }
}
