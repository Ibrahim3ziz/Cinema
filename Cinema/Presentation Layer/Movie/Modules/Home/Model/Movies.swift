//
//  Movies.swift
//  Cinema
//
//  Created by Ibrahim Abdul Aziz on 17/05/2022.
//

import Foundation

struct MoviesResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let adult: Bool?
    let id: Int?
    let title: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let popularity: Double?
    let vote_count: Int?
    let release_date: String?
    let vote_average: Double?
}
