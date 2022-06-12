//
//  MoviePreviewModel.swift
//  Cinema
//
//  Created by Ibrahim Abdul Aziz on 07/06/2022.
//

import Foundation


struct PreviewMovieModel: Codable {
    let id: Int?
    let adult: Bool?
    let title: String?
    let overview: String?
    let poster_path: String?
    let vote_average: Double?
    let original_language: String?
}


