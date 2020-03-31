//
//  OrdersViewModel.swift
//  SwiftUI_Example
//
//  Created by VALERIYA on 31.03.2020.
//  Copyright © 2020 VALERIYA. All rights reserved.
//

import Foundation
import Combine

class OrdersViewModel: ObservableObject {
    @Published var items: [Order] = []
    let didNavigateBack = PassthroughSubject<Void, Never>()
        
    init() {
        self.items = [Order(id: 1, name: "Сергей Иванов", carNumber: "Н 000 НА 00", rating: nil, cost: 8000, date: Date(), workType: "погрузка / с манипулятором", deliveryAddress: "Большая тульская, д.10", status: "Завершен"),
        
                      Order(id: 1, name: "Валера Сидоров", carNumber: "Н 777 НА 00", rating: nil, cost: 4777, date: Date(), workType: "погрузка / с манипулятором", deliveryAddress: "Косоротова, д.8", status: "Завершен")
        ]
    }
    
    func backAction() {
        self.didNavigateBack.send(())
    }
}
