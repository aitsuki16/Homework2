//
//  StackOveflowEntity.swift
//  Homework2
//
//  Created by user on 2024/05/30.
//

import Foundation

struct StackOverflowEntity: Codable {
   
    let owner: Owner
    let score: Int
    let title: String
    let link: String
    let tags: [String]
    let creationDate: Int
    
    enum CodingKeys: String, CodingKey {
        case owner
        case score
        case title
        case link
        case tags
        case creationDate = "creation_date"
    }
}

struct Owner: Codable {
    let displayName: String
    
    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
    }
}
struct StackOverflowSearchResult: Codable {
    let items: [StackOverflowEntity]
}


