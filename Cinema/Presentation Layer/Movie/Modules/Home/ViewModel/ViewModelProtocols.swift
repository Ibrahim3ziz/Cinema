//
//  ViewModelProtocols.swift
//  Cinema
//
//  Created by Ibrahim Abdul Aziz on 05/06/2022.
//

import Foundation

protocol MostPopularViewModelProtocol {
    var numberOfItemsInSection: Int { get }
    var numberOfSection: Int { get }
    func dataSourceForIndex(at indexPath: IndexPath) -> DisplayedPopularMovieViewModel
    func set(popularMovies: [DisplayedPopularMovieViewModel]?)
}

protocol UpcomingViewModelProtocol {
    var numberOfItemsInSection: Int { get }
    var numberOfSection: Int { get }
    func dataSourceForIndex(at indexPath: IndexPath) -> DisplayedUpcomingViewModel
    func set(upcomingMovies: [DisplayedUpcomingViewModel]?)
}


