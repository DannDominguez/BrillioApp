//
//  Model.swift
//  BrillioApp
//
//  Created by Daniela Ciciliano on 16/04/24.
//

import Foundation


// MARK: - QuoteModel
struct QuoteModel: Codable, Hashable {
    let id: String
    let content: String
    var author: String
    let tags: [String]
    let authorSlug: String
    let length: Int
    let dateAdded, dateModified: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case content, author, tags, authorSlug, length, dateAdded, dateModified
    }
}
