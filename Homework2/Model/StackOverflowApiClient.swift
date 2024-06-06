//
//  StackOverflowApiClient.swift
//  Homework2
//
//  Created by user on 2024/05/30.
//

import Foundation

class StackOverflowApiClient {
    struct APIConstant {
        static let baseURL = "https://api.stackexchange.com/2.3"
        static let searchPath = "/search"
        
        static func searchURL(query: String, tag: String) -> String {
            return "\(baseURL)\(searchPath)?order=desc&sort=activity&intitle=\(query)&tagged=\(tag)&site=stackoverflow"
        }
    }
    
    func getRepositories(searchQuery: String, completion: @escaping (Result<[Question], Error>) -> Void) {
        var components = URLComponents(string: APIConstant.baseURL)
        components?.path = APIConstant.searchPath
        components?.queryItems = [
            URLQueryItem(name: "order", value: "desc"),
            URLQueryItem(name: "sort", value: "activity"),
            URLQueryItem(name: "site", value: "stackoverflow"),
            URLQueryItem(name: "q", value: searchQuery),
            URLQueryItem(name: "intitle", value: searchQuery)
        ]
        guard let url = components?.url else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
            
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "no data", code: -1, userInfo: nil)))
                return
            }
            do {
                let decodeResponse = try
                JSONDecoder().decode(StackOverflowSearchResult.self, from:data)
                completion(.success(decodeResponse.items))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
