//
//  PostViewModel.swift
//  SwiftUI_Example
//
//  Created by VALERIYA on 01.04.2020.
//  Copyright © 2020 VALERIYA. All rights reserved.
//

import Foundation
import Combine

class PostViewModel:ObservableObject {
    
    typealias Dependencies = HasPostService
    public var dependencies:Dependencies!
    
    private var cancellables: [AnyCancellable] = []
    private let errorSubject = PassthroughSubject<HTTPError, Never>()
    let didNavigateBack = PassthroughSubject<Void, Never>()
    
    @Published var posts = [Post]()
    @Published var errorMessage = ""
    @Published var isErrorShown = false
    
    init(dependencies:Dependencies) {
        self.dependencies = dependencies
        
        let responsePublisher = self.dependencies.postService.request()
            .sink(receiveCompletion: { [weak self] (completion) in
                switch completion {
                case .finished: print("successful")
                case .failure(let error):
                    self?.errorSubject.send(error)
                }
            }, receiveValue: { (posts) in
                self.posts = posts
            })
        
        self.cancellables += [responsePublisher]
        self.bindOutputs()
    }
    
    private func bindOutputs() {
        let errorCancellable = errorSubject
            .map { error -> String in
                switch error {
                case .statusCode: return "network error"
                case .parseError: return "parse error"
                }
            }
            .assign(to: \.errorMessage, on: self)
        
        let errorStream = errorSubject
            .map { _ in true }
            .assign(to: \.isErrorShown, on: self)
        
        self.cancellables += [
             errorCancellable,
             errorStream
         ]
    }
    
    func backAction() {
        self.didNavigateBack.send(())
    }
}
