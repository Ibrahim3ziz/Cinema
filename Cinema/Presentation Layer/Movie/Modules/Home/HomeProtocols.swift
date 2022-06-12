//
//  HomeProtocols.swift
//  Cinema
//
//  Created Ibrahim Abdul Aziz on 17/05/2022.
//  Copyright © 2022 Ibrahim Abdul Aziz, Co. Ltd. All rights reserved.
//

import Foundation
import UIKit


// MARK: - ViewController -> Interactor
protocol HomeInteractorProtocol: AnyObject {
    func getMostPopularMovies(page: Int)
    func getUpcomingMovies(page: Int)
}

// MARK: - Interactor -> Presenter
protocol HomePresenterProtocol: AnyObject {
    func didFetchMostPopularMoviesSuccessfully(entity: [Movie])
    func didFailFetchingMostPopularMovies(message: NetworkError)
    
    func didFetchUpcomingMoviesSuccessfully(entity: [Movie])
    func didFailFetchingUpcomingMovies(message: NetworkError)
    
}

// MARK: - Presenter -> ViewCotroller
protocol HomeViewProtocol: AnyObject {
    
    func didFetchMostPopularMoviesSuccessfully(viewModel: [DisplayedPopularMovieViewModel])
    func didFailFetchingMostPopularMovies(message: NetworkError)
    
    func didFetchUpcomingMoviesSuccessfully(viewModel: [DisplayedUpcomingViewModel])
    func didFailFetchingUpcomingMovies(message: NetworkError)
    
    
    func didObtainedMostPopularMovie(id: Int)
    func didFailObtainMostPopularMove(message: NetworkError)
        
}

// MARK: - Router
protocol HomeRouterProtocol: AnyObject {

    func routeToPreviewMovieViewController(with id: Int)
    
}
