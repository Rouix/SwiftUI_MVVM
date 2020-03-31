//
//  OrdersViewModel.swift
//  SwiftUI_Example
//
//  Created by VALERIYA on 31.03.2020.
//  Copyright © 2020 VALERIYA. All rights reserved.
//

import Foundation

class OrdersViewModel: ObservableObject {
    @Published var items: [Order] = []
    
    init() {
        self.items = [Order(id: 1, name: "Сергей Иванов", carNumber: "Н 000 НА 00", rating: nil, cost: 8000, date: Date(), workType: "погрузка / с манипулятором", deliveryAddress: "Большая тульская, д.10", status: "Завершен"),
        
                      Order(id: 1, name: "Валера Сидоров", carNumber: "Н 777 НА 00", rating: nil, cost: 4777, date: Date(), workType: "погрузка / с манипулятором", deliveryAddress: "Косоротова, д.8", status: "Завершен")
        ]
    }
}

struct Order:Identifiable {
    var id:Int
    var name:String
    var carNumber:String
    var rating:Double?
    var cost:Int
    var date:Date
    var workType:String
    var deliveryAddress:String
    var status:String
    var formatDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, dd MMMM; HH:mm"
        return dateFormatter.string(from: self.date)
    }
}
