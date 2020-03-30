//
//  SwiftUIView.swift
//  SwiftUIExample
//
//  Created by VALERIYA on 28.03.2020.
//  Copyright © 2020 VALERIYA. All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        Image("temp")
            .frame(width: 200, height: 200)
            .background(Color.black)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 8))
            .shadow(radius: 10)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
