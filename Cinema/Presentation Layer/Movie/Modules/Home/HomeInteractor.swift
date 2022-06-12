//
//  HomeInteractor.swift
//  Cinema
//
//  Created Ibrahim Abdul Aziz on 17/05/2022.
//  Copyright © 2022 Ibrahim Abdul Aziz, Co. Ltd. All rights reserved.
//

import Foundation
import UIKit

class HomeInteractor {
    
    var presenter: HomePresenterProtocol?
    var repoInterface: RepoInterFace?
    
}

// MARK: - Protocol
extension HomeInteractor: HomeInteractorProtocol {
    
    func getMostPopularMovies(page: Int) {
        repoInterface?.getMostPopularMovies(page: page, completion: { [ weak self] mostPopularMovies, error in
            if !mostPopularMovies.isEmpty {
                self?.presenter?.didFetchMostPopularMoviesSuccessfully(entity: mostPopularMovies)
            } else {
                self?.presenter?.didFailFetchingMostPopularMovies(message: error!)
            }
        })
    }
    
    
    func getUpcomingMovies(page: Int) {
        repoInterface?.getUpcomingMovies(page: page, completion: { [weak self] upcomingMovies , error in
            if !upcomingMovies.isEmpty {
                self?.presenter?.didFetchUpcomingMoviesSuccessfully(entity: upcomingMovies)
            } else {
                self?.presenter?.didFailFetchingUpcomingMovies(message: error!)
            }
        })
    }
}

// MARK: - Private Methods
extension HomeInteractor {
    
}
