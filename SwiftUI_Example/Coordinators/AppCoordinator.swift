//
//  AppCoordinator.swift
//  SwiftUI_Example
//
//  Created by VALERIYA on 31.03.2020.
//  Copyright © 2020 VALERIYA. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class AppCoordinator: Coordinator, CoordinatorProtocol {
    let window: UIWindow
    private var openOrdersPass: AnyCancellable?
    private var pressBack : AnyCancellable?
    
    init(window: UIWindow) {
        self.window = window
        super.init()
    }

    var navigationController: UINavigationController! {
        window.rootViewController as? UINavigationController
    }

    func start() {
        self.showMainView()
    }

    private func showMainView() {
        let viewModel = ContentViewModel()

        self.openOrdersPass = viewModel.openOrders
            .sink { [weak self] in
            self?.showMyOrders()
        }
                
        let view = ContentView(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        let nav = UINavigationController(rootViewController: controller)
        nav.navigationBar.isHidden = true
        window.rootViewController = nav
    }

    private func showMyOrders() {
        let viewModel = OrdersViewModel()
    
        self.pressBack = viewModel.didNavigateBack
            .sink { [weak self] in
            self?.navigationController.popViewController(animated: true)
        }
        
        let view = MyOrders(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        navigationController.pushViewController(controller, animated: true)
    }
}

