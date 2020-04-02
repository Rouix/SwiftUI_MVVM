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

class AppCoordinator: Coordinator, CoordinatorProtocol, NeedsDependency {
    let window: UIWindow
    private var cancellable = [AnyCancellable]()
    
    var dependencies: AppDependency? {
        didSet {
            updateChildCoordinatorDependencies()
        }
    }
    
    var navigationController: UINavigationController! {
        window.rootViewController as? UINavigationController
    }

    init(window: UIWindow) {
        self.window = window
        self.dependencies = AppDependency()
        super.init()
    }
    
    func start() {
        self.showMainView()
    }

    private func showMainView() {
        let viewModel = ContentViewModel()

        let openOrdersPass = viewModel.openOrders
            .sink { [weak self] in
            self?.showMyOrders()
        }
         
        let openPosts = viewModel.goToPosts
            .sink { [weak self] in
            self?.showPosts()
        }
        
        self.cancellable += [openPosts, openOrdersPass]
        let view = ContentView(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        let nav = UINavigationController(rootViewController: controller)
        nav.navigationBar.isHidden = true
        window.rootViewController = nav
    }

    private func showMyOrders() {
        let viewModel = OrdersViewModel()
    
        let pressBack = viewModel.didNavigateBack
            .sink { [weak self] in
            self?.navigationController.popViewController(animated: true)
        }
        self.cancellable += [pressBack]
        let view = MyOrders(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func showPosts() {
        let viewModel = PostViewModel(dependencies: self.dependencies!)
    
        let pressBack = viewModel.didNavigateBack
            .sink { [weak self] in
            self?.navigationController.popViewController(animated: true)
        }
        self.cancellable += [pressBack]
        let view = PostListView(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        navigationController.pushViewController(controller, animated: true)
    }
}

