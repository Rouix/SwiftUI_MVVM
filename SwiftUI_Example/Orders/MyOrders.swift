//
//  MyOrders.swift
//  SwiftUI_Example
//
//  Created by VALERIYA on 31.03.2020.
//  Copyright © 2020 VALERIYA. All rights reserved.
//

import SwiftUI

struct MyOrders: View {
    @ObservedObject var viewModel: OrdersViewModel
    
    init(viewModel: OrdersViewModel){
        UITableView.appearance().backgroundColor = .clear
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Image("background")
                         .resizable()
                         .aspectRatio(geometry.size, contentMode: .fill)
                         .edgesIgnoringSafeArea(.all)
                    
                    List() {
                        ForEach(self.viewModel.items) { item in
                            OrderCell(item: item)
                                .listRowInsets(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                            
                        }
                    }
                }
            }
            .navigationBarTitle(Text("История заказов"), displayMode: .inline)
            .navigationBarItems(leading: Button(action: viewModel.backAction) {
                Text("Назад")
            })
    }
    }
}

struct MyOrders_Previews: PreviewProvider {
    static var previews: some View {
        MyOrders(viewModel: .init())
    }
}
