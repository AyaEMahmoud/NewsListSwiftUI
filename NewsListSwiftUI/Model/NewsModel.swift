//
//  NewsModel.swift
//  NewsListSwiftUI
//
//  Created by Aya Essam on 08/03/2021.
//

import Foundation
import Combine

// MARK: - Response
struct Response: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let source: Source
    var author, title, articleDescription: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}

// MARK: - Source
struct Source: Codable {
    let id: ID
    let name: Name
}

enum ID: String, Codable {
    case reuters = "reuters"
    case techcrunch = "techcrunch"
}

enum Name: String, Codable {
    case reuters = "Reuters"
    case techCrunch = "TechCrunch"
}
