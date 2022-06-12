//
//  MoviePreviewInteractor.swift
//  Cinema
//
//  Created Ibrahim Abdul Aziz on 06/06/2022.
//  Copyright © 2022 Ibrahim Abdul Aziz, Co. Ltd. All rights reserved.
//

import Foundation

class MoviePreviewInteractor {
    
    var presenter: MoviePreviewPresenterProtocol?
    var repoInterface: RepoInterface?
    
}

// MARK: - Protocol
extension MoviePreviewInteractor: MoviePreviewInteractorProtocol {
    func showMovie(with id: Int) {
        repoInterface?.showMovie(id: id, completion: { [weak self] showedMovie, error in
            if showedMovie != nil {
                self?.presenter?.didFetchPreviewMovieSuccessfully(entity: showedMovie!)
            } else {
                self?.presenter?.didFailFetchingPreviewMovie(error: error!)
            }

        })
    }
    
    
    
    
}

// MARK: - Private Methods
extension MoviePreviewInteractor {
    
}

