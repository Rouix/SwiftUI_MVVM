//
//  PostViewModel.swift
//  SwiftUI_Example
//
//  Created by VALERIYA on 01.04.2020.
//  Copyright © 2020 VALERIYA. All rights reserved.
//

import Foundation
import Combine
import Resolver

class PostViewModel:ObservableObject {
    
    private var cancellables: Set<AnyCancellable> = []
    private let errorSubject = PassthroughSubject<HTTPError, Never>()
    let didNavigateBack = PassthroughSubject<Void, Never>()
    
    @Published var posts = [Post]()
    @Published var errorMessage = ""
    @Published var isErrorShown = false
    
    @Injected var postService: PostService
    
    init() {
        self.postService.request()
            .sink(receiveCompletion: { [weak self] (completion) in
                switch completion {
                case .finished: print("successful")
                case .failure(let error):
                    self?.errorSubject.send(error)
                }
            }, receiveValue: { (posts) in
                self.posts = posts
            }).store(in: &cancellables)
        
        self.bindOutputs()
    }
    
    private func bindOutputs() {
        errorSubject
            .map { error -> String in
                switch error {
                case .statusCode: return "network error"
                case .parseError: return "parse error"
                }
            }
            .assign(to: \.errorMessage, on: self)
            .store(in: &cancellables)
        
        errorSubject
            .map { _ in true }
            .assign(to: \.isErrorShown, on: self)
            .store(in: &cancellables)
        
    }
    
    func backAction() {
        self.didNavigateBack.send(())
    }
}
