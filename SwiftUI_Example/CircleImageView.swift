//
//  CircleImageView.swift
//  SwiftUI_Example
//
//  Created by VALERIYA on 31.03.2020.
//  Copyright © 2020 VALERIYA. All rights reserved.
//

import SwiftUI

struct CircleImageView: View {
    var body: some View {
        Image("profile")
            .frame(width: 200, height: 200)
            .background(Color.black)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 8))
            .shadow(radius: 10)
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView()
    }
}
