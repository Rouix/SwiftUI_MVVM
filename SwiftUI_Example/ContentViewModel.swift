//
//  ContentViewModel.swift
//  SwiftUI_Example
//
//  Created by VALERIYA on 31.03.2020.
//  Copyright © 2020 VALERIYA. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

extension Notification.Name {
    static let color = Notification.Name("colorGenerator")
}

class ContentViewModel: ObservableObject {
    
    //if need pass data
    let openOrders = PassthroughSubject<Void, Never>()
    let goToPosts = PassthroughSubject<Void, Never>()
    let goToPodcasts = PassthroughSubject<Void, Never>()
    @Published var times:Int = 0
    @Published var buttonColor = Color.black
    private var cancellableTimer: AnyCancellable?
    private var cancellableButtonColor: AnyCancellable?
    
    init() {
        self.cancellableButtonColor = NotificationCenter.Publisher(center: .default, name: .color, object: nil)
        .sink { notification in
            if let color = notification.object as? Color {
                self.buttonColor = color
            }
        }
        
    }
    
    func openMyOrders() {
        self.openOrders.send(())
    }
    
    func openPosts() {
        self.goToPosts.send(())
    }
    
    func openPodcasts() {
        self.goToPodcasts.send(())
    }
    
    func startTimer() {
        // start automatically
        self.cancellableTimer = Timer.publish(every: 2, on: .main, in: .default)
        .autoconnect()
            .sink {_ in
            self.times += 1
        }
        
        
        // start manually
//        let timerPublisher = Timer.publish(every: 1.0, on: RunLoop.main, in: .default)
//        cancellable = timerPublisher
//        .sink {
//            print($0)
//        }
        // start publishing time
        //let cancellableTimerPublisher = timerPublisher.connect()
        // stop publishing time
        //cancellableTimerPublisher.cancel()

        // cancel subscription
        //cancellable?.cancel()
    }
    
    func scubcribeToNotifications() {
        let colors = [Color.black, Color.red, Color.green, Color.yellow, Color.blue]
        NotificationCenter.default.post(name: .color, object: colors.randomElement())
    }
}
