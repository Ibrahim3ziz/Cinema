//
//  UpcomingViewModel.swift
//  Cinema
//
//  Created by Ibrahim Abdul Aziz on 05/06/2022.
//

import Foundation

struct DisplayedUpcomingViewModel {
    private(set) var posterURL: String?
    private(set) var id: Int?
    
    init(entity: Movie) {
        self.posterURL = entity.poster_path
        self.id =  entity.id
    }
}


class UpcomingViewModel: UpcomingViewModelProtocol {
    
    // MARK: - Properties
    private(set) var upcomingMovies: [DisplayedUpcomingViewModel] = [DisplayedUpcomingViewModel]()
    
    init () { }
    
    var numberOfItemsInSection: Int {
        upcomingMovies.count
    }
    
    var numberOfSection: Int {
        return 1 
    }
    
    func set(upcomingMovies: [DisplayedUpcomingViewModel]?) {
        self.upcomingMovies = upcomingMovies!
    }
    
    func dataSourceForIndex(at indexPath: IndexPath) -> DisplayedUpcomingViewModel {
        let viewModel = upcomingMovies[indexPath.row]
        return viewModel
    }
}
