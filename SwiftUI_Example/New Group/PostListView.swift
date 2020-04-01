//
//  PostListView.swift
//  SwiftUI_Example
//
//  Created by VALERIYA on 01.04.2020.
//  Copyright © 2020 VALERIYA. All rights reserved.
//

import SwiftUI
import Combine

struct PostListView: View {
    @ObservedObject var viewModel:PostViewModel
    
    init(viewModel:PostViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
                List() {
                    ForEach(viewModel.posts) { item in
                        Text("\(item.title)")
                    }
                }
                .alert(isPresented: $viewModel.isErrorShown, content: { () -> Alert in
                    Alert(title: Text("Error"), message: Text(viewModel.errorMessage))
                })
                    
                .navigationBarTitle(Text("Посты"), displayMode: .inline)
                .navigationBarItems(leading: Button(action: viewModel.backAction) {
                    Text("Назад")
                })
        }
        
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView(viewModel: .init(dependencies: PostService() as! HasPostService))
    }
}
