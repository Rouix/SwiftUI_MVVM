//
//  OrderCell.swift
//  SwiftUI_Example
//
//  Created by VALERIYA on 31.03.2020.
//  Copyright © 2020 VALERIYA. All rights reserved.
//

import SwiftUI

struct OrderCell: View {
    @State var item: Order

     var body: some View {
         VStack(alignment: .leading, spacing: 0) {
             HStack() {
                 Image("profile")
                     .frame(width: 69, height: 69)
                     .background(Color.black)
                     .clipShape(Circle())
                 VStack(alignment: .leading) {
                     Text(self.item.name)
                         .bold()
                         .font(.system(size: 20))
                         .padding(.bottom, 5)
                     Text(self.item.carNumber)
                         .font(.system(size: 16))
                 }.padding(.leading, 36)
                    .padding(.trailing, 16)
             }
             
             HStack() {
                 VStack(alignment: .leading) {
                     Text("Оценка " + "\(self.item.rating ?? 0.0)")
                         .font(.system(size: 14))
                         .foregroundColor(.gray)
                 }
                 VStack(alignment: .leading) {
                     Text("Стоимость")
                         .font(.system(size: 14))
                         .foregroundColor(.gray)
                     Text("\(self.item.cost)")
                         .font(.system(size: 20))
                         .bold()
                 }
             }.padding(.bottom, 8)
             
             Text("Дата и время")
                 .font(.system(size: 14))
                 .foregroundColor(.gray)
                 .padding(.bottom, 4)
             
             Text("\(self.item.formatDate)")
                 .font(.system(size: 17))
                 .bold()
                 .padding(.bottom, 8)
             
             Text("Вид работы")
                 .font(.system(size: 14))
                 .foregroundColor(.gray)
                 .padding(.bottom, 4)
             
             Text(self.item.workType)
                 .font(.system(size: 17))
                 .bold()
                 .padding(.bottom, 8)
             
             Text("Адрес доставки")
                 .font(.system(size: 14))
                 .foregroundColor(.gray)
                 .padding(.bottom, 4)
             
             Text(self.item.deliveryAddress)
                 .font(.system(size: 17))
                 .bold()
                 .padding(.bottom, 8)
             
             Text("Статус")
                 .font(.system(size: 14))
                 .foregroundColor(.gray)
                 .padding(.bottom, 4)
             
            HStack() {
                Text(self.item.status)
                    .font(.system(size: 20))
                    .bold()
                    .padding(.bottom, 8)
                    .foregroundColor(.green)
                
                Spacer()
                Button(action: {

                }) {
                    Text("Оценить")
                        .font(.system(size: 17))
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                        .cornerRadius(10)
                        .foregroundColor(.blue)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                }
                    .padding(10)
            }

             
         }   .padding(.leading, 16)
             .padding(.top, 16)
             .cornerRadius(8.0)
     }

}

struct OrderCell_Previews: PreviewProvider {
    static var previews: some View {
        OrderCell(item: Order(id: 1, name: "", carNumber: "", rating: nil, cost: 0, date: Date(), workType: "", deliveryAddress: "", status: ""))
        .previewLayout(.fixed(width: 300, height: 350))
    }
}
