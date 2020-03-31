//
//  Order.swift
//  SwiftUI_Example
//
//  Created by VALERIYA on 31.03.2020.
//  Copyright © 2020 VALERIYA. All rights reserved.
//

import Foundation

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
