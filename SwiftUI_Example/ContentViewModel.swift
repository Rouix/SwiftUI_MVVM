//
//  ContentViewModel.swift
//  SwiftUI_Example
//
//  Created by VALERIYA on 31.03.2020.
//  Copyright © 2020 VALERIYA. All rights reserved.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    
    //if need pass data
    let openOrders = PassthroughSubject<Void, Never>()
    
    init() {}
    
    func openMyOrders() {
        self.openOrders.send(())
    }
}
