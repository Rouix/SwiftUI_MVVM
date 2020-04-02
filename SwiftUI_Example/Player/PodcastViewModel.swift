//
//  PodcastViewModel.swift
//  SwiftUI_Example
//
//  Created by VALERIYA on 02.04.2020.
//  Copyright © 2020 VALERIYA. All rights reserved.
//

import Foundation
import Combine

class PodcastViewModel: ObservableObject {
    let didNavigateBack = PassthroughSubject<Void, Never>()
    
    func backAction() {
        self.didNavigateBack.send(())
    }
}
