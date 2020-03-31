//
//  Coordinator.swift
//  SwiftUI_Example
//
//  Created by VALERIYA on 31.03.2020.
//  Copyright © 2020 VALERIYA. All rights reserved.
//

import Foundation

protocol CoordinatorProtocol {
    var child: CoordinatorProtocol? { get }
    func start()
}

class Coordinator {
    var child: CoordinatorProtocol?
}
