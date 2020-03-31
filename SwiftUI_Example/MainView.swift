//
//  MainView.swift
//  SwiftUI_Example
//
//  Created by VALERIYA on 31.03.2020.
//  Copyright © 2020 VALERIYA. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        ScrollView(Axis.Set.vertical) {
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 400)
            
            VStack(alignment: .center) {
                CircleImageView()
                VStack {
                    NavigationLink(destination: MyOrders(viewModel: .init())) {
                        Text("go to")
                    }
                    Text("-19")
                        .foregroundColor(.blue)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .padding()
                }
            }
            .offset(x: 0, y: -100)
        }
    }

}
