//
//  StackOverflowRepository.swift
//  Homework2
//
//  Created by user on 2024/05/30.
//

import Foundation

class StackOverflowRepository {
    private let apiClient: StackOverflowApiClient
    
    init(apiClient: StackOverflowApiClient = StackOverflowApiClient()) {
        self.apiClient = apiClient
    }
    
    func fetchRepositories(searchQuery: String, completion: @escaping(
        Result<[StackOverflowEntity], Error>) -> Void) {
            apiClient.getRepositories(searchQuery: searchQuery) {
                result in
                switch result {
                case.success(let entities):
                    completion(.success(entities))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
}
