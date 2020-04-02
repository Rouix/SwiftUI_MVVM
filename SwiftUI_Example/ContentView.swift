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
    @ObservedObject var viewModel: ContentViewModel
    @State private var newPosition: CGSize = .zero
    
    var body: some View {
        return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    MainView(showMenu: self.$showMenu, viewModel: self.viewModel)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showMenu ? geometry.size.width*0.9 : 0)
                        .disabled(self.showMenu ? true : false)
                    if self.showMenu {
                        MenuContent(viewModel: self.viewModel)
                            .frame(width: geometry.size.width/0.9)
                            .transition(.move(edge: .leading))
                    }
                }
                .gesture(
                    
                    DragGesture()
                        .onChanged({ value in
                            //self.showMenu.toggle()
                        })
                        .onEnded({ value in
                            if value.translation.width < -100 {
                                withAnimation {
                                    self.showMenu = false
                                }
                            }

                        }))
                //SwipeGesture()
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
    @State var isModal: Bool = false
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        ScrollView(Axis.Set.vertical) {
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 400)
            
            VStack(alignment: .center) {
                CircleImageView()
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
                    
                    Text("-19")
                        .foregroundColor(.blue)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .padding()

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
    }

}


struct SwipeGesture: UIViewRepresentable {
    
    func makeCoordinator() -> SwipeCoordinator {
        return SwipeCoordinator()
    }
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        let left = UISwipeGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.left))
        let right = UISwipeGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.right))
        left.direction = .left
        right.direction = .right
        
        view.addGestureRecognizer(left)
        view.addGestureRecognizer(right)
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    class SwipeCoordinator : NSObject {
        
        @objc func left() {
            print("left")
        }
        
        @objc func right() {
            print("right")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init())
    }
}
