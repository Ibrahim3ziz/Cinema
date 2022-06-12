//
//  PreviewMovieViewModel.swift
//  Cinema
//
//  Created by Ibrahim Abdul Aziz on 06/06/2022.
//

import Foundation

struct DisplayedPreviewMovieViewModel {
    private(set) var id: Int?
    private(set) var titleName: String?
    private(set) var posterURL: String?
    private(set) var voteAverage: Double?
    private(set) var adult: Bool?
    private(set) var overview: String?
    private(set) var originalLanguage: String?

    
    init(entity: PreviewMovieModel) {
        titleName = entity.title
        posterURL = entity.poster_path
        voteAverage = entity.vote_average
        adult = entity.adult
        overview = entity.overview
        id = entity.id
        originalLanguage = entity.original_language
    }
}
