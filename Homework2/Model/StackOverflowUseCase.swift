//
//  StackOverflowUseCase.swift
//  Homework2
//
//  Created by user on 2024/05/30.
//
import Foundation

class StackOverflowUseCase {
    private let repository: StackOverflowRepository
    
    init(repository: StackOverflowRepository = StackOverflowRepository()) {
        self.repository = repository
    }
    
    func getQuestions(searchQuery: String, completion: @escaping (Result<[Question],Error>) -> Void) {
        repository.fetchRepositories(searchQuery: searchQuery) { result in
            completion(result)
            
        }
    }
}
