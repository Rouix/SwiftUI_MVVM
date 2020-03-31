//
//  MenuContent.swift
//  SwiftUI_Example
//
//  Created by VALERIYA on 31.03.2020.
//  Copyright © 2020 VALERIYA. All rights reserved.
//

import SwiftUI

struct MenuContent: View {
    var newOrders: Int = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Image("icon")
                    .frame(width: 40.0, height: 35.0)
                Text("993 | Доставка лома")
                    .bold()
            }.padding(.bottom, 35)

            HStack {
                Image("profile")
                    .frame(width: 60.0, height: 60.0)
                Text("+7 (000) 000-00-00")
                    .font(.system(size: 22))
            }.padding(.bottom, 29)

            Button(action: {
               //go to another view
            }) {
                Image("mapPin")
                .frame(width: 22.0, height: 22.0)
                
                Text("Карта города")
                .foregroundColor(Color.black)
            }.padding(.bottom, 22)
            
            Button(action: {
               //go to another view
            }) {
                Image("orders")
                .frame(width: 22.0, height: 22.0)
                
                Text("Мои заказы")
                .foregroundColor(Color.black)
                
                Spacer()
                Text(self.newOrders > 0 ? String(self.newOrders) : "")
                .foregroundColor(Color.red)
                
            }.padding(.bottom, 22)
                        
            Button(action: {
               //go to another view
            }) {
                Image("history")
                .frame(width: 22.0, height: 22.0)
                
                Text("История заказов")
                .foregroundColor(Color.black)
            }.padding(.bottom, 22)
            
            Spacer()
        }
            .padding()
            .padding(.leading, 24)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct MenuContent_Previews: PreviewProvider {
    static var previews: some View {
        MenuContent()
    }
}
