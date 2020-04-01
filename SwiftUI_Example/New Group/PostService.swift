//
//  PostService.swift
//  SwiftUI_Example
//
//  Created by VALERIYA on 01.04.2020.
//  Copyright © 2020 VALERIYA. All rights reserved.
//

import Foundation
import Combine

class PostService {
    
    private let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    private var cancellable: AnyCancellable?
    
    func request() -> AnyPublisher<[Post], HTTPError> {
        let request = URLRequest(url: self.url)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { data, urlResponse in data }
            .mapError { _ in HTTPError.statusCode }
            .decode(type: [Post].self, decoder: JSONDecoder())
            .mapError(HTTPError.parseError)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}


protocol HasPostService {
    var postService: PostService! { get }
}

extension AppDependency:HasPostService {
    private static var postService:PostService!
    
    var postService: PostService! {
        if let shared = AppDependency.postService {
            return shared
        } else {
            let result = PostService()
            AppDependency.postService = result
            return result
        }
        
    }
}
