//
//  MoviePreviewProtocols.swift
//  Cinema
//
//  Created Ibrahim Abdul Aziz on 06/06/2022.
//  Copyright © 2022 Ibrahim Abdul Aziz, Co. Ltd. All rights reserved.
//

import Foundation


// MARK: - ViewController -> Interactor
protocol MoviePreviewInteractorProtocol: AnyObject {
    func showMovie(with id: Int)
}

// MARK: - Interactor -> Presenter
protocol MoviePreviewPresenterProtocol: AnyObject {
    func didFetchPreviewMovieSuccessfully(entity: PreviewMovieModel)
    func didFailFetchingPreviewMovie(error: NetworkError)
}

// MARK: - Presenter -> ViewCotroller
protocol MoviePreviewViewProtocol: AnyObject {
    func didFetchPreviewMovieSuccessfully(viewModel: DisplayedPreviewMovieViewModel)
    func didFailFetchPreviewMovie(error: NetworkError)
    
}

// MARK: - Router
protocol MoviePreviewRouterProtocol: AnyObject {
}
