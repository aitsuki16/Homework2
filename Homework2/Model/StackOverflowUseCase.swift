//
//  StackOverflowUseCase.swift
//  Homework2
//
//  Created by user on 2024/05/30.
//
import Foundation

class StackOverflowUseCase {
    private let question: StackOverflowRepository
    
    init(question: StackOverflowRepository = StackOverflowRepository()) {
        self.question = question
    }
    
    func getQuestions(searchQuery: String, completion: @escaping (Result<[Question],Error>) -> Void) {
        question.fetchRepositories(searchQuery: searchQuery) { result in
            completion(result)
            
        }
    }
}
