//
//  MostPopularViewModel.swift
//  Cinema
//
//  Created by Ibrahim Abdul Aziz on 24/05/2022.
//

import Foundation

struct DisplayedPopularMovieViewModel {
    private(set) var id: Int?
    private(set) var titleName: String?
    private(set) var posterURL: String?
    private(set) var voteAverage: Double?
    
    init(entity: Movie) {
        titleName = entity.title
        posterURL = entity.poster_path
        voteAverage = entity.vote_average
        id = entity.id
    }
    
}

class PopularMovieViewModel: MostPopularViewModelProtocol {
 
    // MARK: - Properties
    private(set) var popularMovies: [DisplayedPopularMovieViewModel] = [DisplayedPopularMovieViewModel]()
    
    init() { }
    
    
    var numberOfItemsInSection: Int {
        return popularMovies.count
    }
    
    var numberOfSection: Int {
        return 1
    }
    
    func set(popularMovies: [DisplayedPopularMovieViewModel]?) {
        guard let popularMovies = popularMovies else {
            return
        }
        self.popularMovies.append(contentsOf: popularMovies)
    }
    
    
    func dataSourceForIndex(at indexPath: IndexPath) -> DisplayedPopularMovieViewModel {
        let viewModel = popularMovies[indexPath.row]
        return viewModel
    }

}








