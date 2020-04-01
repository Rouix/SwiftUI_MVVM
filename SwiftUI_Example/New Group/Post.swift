//
//  Post.swift
//  SwiftUI_Example
//
//  Created by VALERIYA on 01.04.2020.
//  Copyright © 2020 VALERIYA. All rights reserved.
//

import Foundation

enum HTTPError: LocalizedError {
    case statusCode
    case parseError(Error)
}

struct Post: Codable, Identifiable {
    let id: Int
    let title: String
    let body: String
    let userId: Int
}

