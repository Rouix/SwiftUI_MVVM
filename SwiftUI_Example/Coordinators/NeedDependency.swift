//
//  NeedDependency.swift
//  SwiftUI_Example
//
//  Created by VALERIYA on 01.04.2020.
//  Copyright © 2020 VALERIYA. All rights reserved.
//

import Foundation

struct AppDependency {}

protocol NeedsDependency: class {
    var dependencies: AppDependency? { get set }
}

extension NeedsDependency where Self: Coordinator {
    func updateChildCoordinatorDependencies() {
        if let c = self.child as? NeedsDependency {
            c.dependencies = dependencies
        }
    }
}
