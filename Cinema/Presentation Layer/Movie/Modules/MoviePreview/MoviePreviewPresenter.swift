//
//  MoviePreviewPresenter.swift
//  Cinema
//
//  Created Ibrahim Abdul Aziz on 06/06/2022.
//  Copyright © 2022 Ibrahim Abdul Aziz, Co. Ltd. All rights reserved.
//

import Foundation

class MoviePreviewPresenter {

     weak var view: MoviePreviewViewProtocol?
   
    init(interface: MoviePreviewViewProtocol) {
        self.view = interface
    }

}

// MARK: - Protocol
extension MoviePreviewPresenter: MoviePreviewPresenterProtocol {
    
    func didFetchPreviewMovieSuccessfully(entity: PreviewMovieModel) {
        let viewModel = DisplayedPreviewMovieViewModel(entity: entity)
        view?.didFetchPreviewMovieSuccessfully(viewModel: viewModel)
    }

    
    func didFailFetchingPreviewMovie(error: NetworkError) {
        view?.didFailFetchPreviewMovie(error: error)
    }
    

}

// MARK: - Private Methods
extension MoviePreviewPresenter {
    
}

