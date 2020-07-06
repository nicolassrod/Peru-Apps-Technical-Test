//
//  Movie.swift
//  Peru Apps Technical Test
//
//  Created by Nicolás A. Rodríguez on 7/4/20.
//

import Foundation

// MARK: - Movie
struct Movie: Codable, Hashable {
    let id = UUID()
    let data: [MovieData]
    let links: Links
    let meta: Meta
    let status: Int
    
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        lhs.id == rhs.id
    }
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case links = "links"
        case meta = "meta"
        case status = "status"
    }
}

// MARK: - MovieData
struct MovieData: Codable, Hashable {
    let id: Int
    let detail: Detail
    
    static func == (lhs: MovieData, rhs: MovieData) -> Bool {
        lhs.id == rhs.id
    }

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case detail = "detail"
    }
}

// MARK: - Detail
struct Detail: Codable, Hashable {
    let title: String
    let description: String
    let img: String

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "description"
        case img = "img"
    }
}

// MARK: - Links
struct Links: Codable, Hashable {
    let first: String?
    let last: String?
    let prev: String?
    let next: String?

    enum CodingKeys: String, CodingKey {
        case first = "first"
        case last = "last"
        case prev = "prev"
        case next = "next"
    }
}

// MARK: - Meta
struct Meta: Codable, Hashable {
    let currentPage: Int
    let from: Int
    let lastPage: Int
    let path: String
    let perPage: Int
    let to: Int
    let total: Int

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case from = "from"
        case lastPage = "last_page"
        case path = "path"
        case perPage = "per_page"
        case to = "to"
        case total = "total"
    }
}
