//
//  HomePresenter.swift
//  Cinema
//
//  Created Ibrahim Abdul Aziz on 17/05/2022.
//  Copyright © 2022 Ibrahim Abdul Aziz, Co. Ltd. All rights reserved.
//

import Foundation

class HomePresenter {
    
    weak var view: HomeViewProtocol?
    init(interface: HomeViewProtocol) {
        self.view = interface
    }
}

// MARK: - Protocol
extension HomePresenter: HomePresenterProtocol {
    
    // -> Here the presenter transform the Movies plain data into MoviesViewModel
    
    func didFetchMostPopularMoviesSuccessfully(entity: [Movie]) {
        let viewModel = entity.map { DisplayedPopularMovieViewModel(entity: $0)}
        view?.didFetchMostPopularMoviesSuccessfully(viewModel: viewModel)
    }

    
    func didFailFetchingMostPopularMovies(message: NetworkError) {
        view?.didFailFetchingMostPopularMovies(message: message)
    }
    
    
    func didFetchUpcomingMoviesSuccessfully(entity: [Movie]) {
        let viewModel = entity.map { DisplayedUpcomingViewModel(entity: $0)}
        view?.didFetchUpcomingMoviesSuccessfully(viewModel: viewModel)
    }
    
    
     func didFailFetchingUpcomingMovies(message: NetworkError) {
         view?.didFailFetchingMostPopularMovies(message: message)
     }
    
    
}

// MARK: - Private Methods
extension HomePresenter {
    
}



