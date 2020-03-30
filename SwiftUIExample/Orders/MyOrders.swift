//
//  MyOrders.swift
//  SwiftUIExample
//
//  Created by VALERIYA on 30.03.2020.
//  Copyright © 2020 VALERIYA. All rights reserved.
//

import SwiftUI

struct MyOrders: View {
    @ObservedObject var viewModel: OrdersViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Image("orderBackground")
                     .resizable()
                     .aspectRatio(geometry.size, contentMode: .fill)
                     .edgesIgnoringSafeArea(.all)
                
                List() {
                    ForEach(self.viewModel.items) { item in
                        OrderCell(item: item)
                            .listRowInsets(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                        
                    }
                }.background(Color.clear)
            
            }
        }
        .navigationBarTitle(Text("История заказов"))
        
    }
}

struct MyOrders_Previews: PreviewProvider {
    static var previews: some View {
        MyOrders(viewModel: .init())
    }
}
