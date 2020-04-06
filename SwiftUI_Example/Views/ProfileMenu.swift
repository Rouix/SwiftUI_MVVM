//
//  MenuContent_2.swift
//  SwiftUI_Example
//
//  Created by VALERIYA on 06.04.2020.
//  Copyright © 2020 VALERIYA. All rights reserved.
//

import SwiftUI

struct ProfileMenu: View {
    @ObservedObject var viewModel: ContentViewModel
    @Binding var showProfile: Bool
    
    @State private var name: String = "Сорока Борис"
    @State private var phone: String = "+7 (000) 00 00"
    @State private var notificationState: Bool = false
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Image("profile")
                        .frame(width: 60.0, height: 60.0)
                    
                    VStack() {
                        TextField("Имя", text: self.$name)
                            .foregroundColor(.black)
                            .font(.system(size: (18.0)))
                        
                        TextField("Телефон", text: self.$phone)
                            .foregroundColor(.gray)
                            .font(.system(size: (14.0)))

                    }
                }.padding(.bottom, 54.0)

                Button(action: {
                   //go to another view
                }) {
                    Image("notification")
                    .frame(width: 16.0, height: 20.0)
                    
                    Text("Уведомление")
                    .foregroundColor(Color.black)
                    
                    Toggle("", isOn: self.$notificationState)
                }.padding(.bottom, 21.0)
                
                            
                Button(action: {
                   //go to another view
                }) {
                    Image("logout")
                    .frame(width: 23.0, height: 18.0)
                    
                    Text("Выйти")
                    .foregroundColor(Color.black)
                }.padding(.bottom, 27.0)
                
                Rectangle()
                    .frame(height: 1.0)
                    .foregroundColor(.gray)
                    .padding(.bottom, 17.0)
                
                Button(action: {
                   //go to another view
                }) {
                    Image("logoApp")
                    .frame(width: 23.0, height: 18.0)
                    
                    Text("О приложении")
                    .foregroundColor(Color.black)
                }.padding(.bottom, 22.0)
                
                Button(action: {
                    //go to another view
                 }) {
                     Image("chat")
                     .frame(width: 23.0, height: 18.0)
                     
                     Text("Служба поддержки")
                     .foregroundColor(Color.black)
                 }.padding(.bottom, 43.0)
                
                Button(action: {
                   //go to another view
                }) {
                    Image("rate")
                    .frame(width: 23.0, height: 18.0)
                    
                    Text("Оцените нас")
                    .foregroundColor(Color.black)
                }.padding(.bottom, 22.0)
                
                Button(action: {
                   //go to another view
                }) {
                    Image("privacy")
                    .frame(width: 23.0, height: 18.0)
                    
                    Text("Конфиденциальность")
                    .foregroundColor(Color.black)
                }.padding(.bottom, 22.0)
                
                Spacer()
            }
                    .padding()
                    .padding(.leading, 16)
                    .padding(.top, 40)
                    .frame(maxWidth: .infinity, alignment: .leading)
        }
                
            .navigationBarTitle("Профиль", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
               //go to another view
                self.viewModel.backAction()
                self.showProfile.toggle()
            }) {
                Text("Профиль")
            })
    }
    
}


struct ProfileMenuPreviews: PreviewProvider {
    @State static var showProfileConstant = true
    
    static var previews: some View {
        ProfileMenu(viewModel: .init(), showProfile: self.$showProfileConstant)
    }
}
