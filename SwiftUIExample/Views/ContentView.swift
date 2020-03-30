//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by VALERIYA on 28.03.2020.
//  Copyright © 2020 VALERIYA. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var showMenu = false
    @ObservedObject var viewModel: ContentViewModel

    var body: some View {
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.showMenu = false
                    }
                }
            }
        
        return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    MainView(showMenu: self.$showMenu)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showMenu ? geometry.size.width*0.9 : 0)
                        .disabled(self.showMenu ? true : false)
                    if self.showMenu {
                        MenuContent()
                            .frame(width: geometry.size.width/0.9)
                            .transition(.move(edge: .leading))
                    }
                }
                    .gesture(drag)
            }
                .navigationBarTitle("Side Menu", displayMode: .inline)
                .navigationBarItems(leading: (
                    Button(action: {
                        withAnimation {
                            self.showMenu.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                    }
                ))
        }
    }
}

struct MainView: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        ScrollView(Axis.Set.vertical) {
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 400)
            
            VStack(alignment: .center) {
                SwiftUIView()
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init())
    }
}
