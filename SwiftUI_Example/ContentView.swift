//
//  ContentView.swift
//  SwiftUI_Example
//
//  Created by VALERIYA on 31.03.2020.
//  Copyright © 2020 VALERIYA. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var showMenu = false
    @State var showProfile = false
    @ObservedObject var viewModel: ContentViewModel
    @State private var newPosition: CGSize = .zero
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                MainView(showMenu: self.$showMenu, viewModel: self.viewModel)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(x: self.showMenu ? geometry.size.width*0.9 : 0)
                    .disabled(self.showMenu ? true : false)
                if self.showMenu {
                    if self.showProfile {
                        ProfileMenu(viewModel: self.viewModel, showProfile: self.$showProfile)
                        .frame(width: geometry.size.width*0.9)
                        .transition(.move(edge: .leading))
                        
                    } else {
                        MenuContent(viewModel: self.viewModel, showProfile: self.$showProfile)
                            .frame(width: geometry.size.width/0.9)
                            .transition(.move(edge: .leading))
                    }
                }
            }
            .edgesIgnoringSafeArea(.top)
            .gesture(
                DragGesture()
                    .onEnded({ value in
                        if value.translation.width < -100 {
                            withAnimation {
                                self.showMenu = false
                            }
                        }

            }))
        }
    }

}

struct MainView: View {
    @Binding var showMenu: Bool
    @State var isModal: Bool = false
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        ScrollView(Axis.Set.vertical) {
            
            ZStack() {
                VStack() {
                    MapView()
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 500)
                    
                    VStack(alignment: .center) {
                        CircleImageView()
                            .padding(.bottom,  24.0)
                        VStack {
                            NavigationLink(destination: MyOrders(viewModel: .init())) {
                                Text("go to orders - navigation Link")
                            }
                            
                            Button("go to orders (modal)") {
                                self.isModal = true
                            }.sheet(isPresented: $isModal, content: {
                                MyOrders(viewModel: .init())
                            })
                            
                            Button(action: {
                                self.viewModel.openMyOrders()
                            }) {
                                Text("go to orders via coordinator")
                            }
                            
                            Button(action: {
                                self.viewModel.startTimer()
                            }) {
                                Text("Start timer: \(self.viewModel.times)")
                            }
                            
                            Button(action: {
                                self.viewModel.scubcribeToNotifications()
                            }) {
                                Text("subscribe to notifications")
                            }.foregroundColor(self.viewModel.buttonColor)
                            
                            Button(action: {
                                self.viewModel.openPodcasts()
                            }) {
                                Text("open podcasts")
                            }
                        }
                    }
                    .offset(x: 0, y: -100)
                    
                }
                
                Button(action: {
                    self.showMenu.toggle()
                }) {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                        .frame(width: 40, height: 40)
                        .foregroundColor(.blue)
                        .background(Color.white)
                        .clipShape(Circle())
                }
                .position(x: 40, y: 70)
            }
            
        }
        
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init())
    }
}
