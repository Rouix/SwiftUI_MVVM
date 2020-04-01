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
    @ObservedObject var viewModel = PostViewModel()
    
    var body: some View {
        List() {
            ForEach(viewModel.posts) { item in
                Text("\(item.title)")
            }
        }
        .alert(isPresented: $viewModel.isErrorShown, content: { () -> Alert in
            Alert(title: Text("Error"), message: Text(viewModel.errorMessage))
        })
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
