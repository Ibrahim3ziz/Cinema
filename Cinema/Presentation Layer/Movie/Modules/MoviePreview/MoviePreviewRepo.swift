//
//  MoviePreviewRepo.swift
//  Cinema
//
//  Created by Ibrahim Abdul Aziz on 07/06/2022.
//

import Foundation

protocol RepoInterface {
    func showMovie(id: Int, completion: @escaping (PreviewMovieModel?, NetworkError?) -> Void)
}


class RepoImplementation: RepoInterface {
    func showMovie(id: Int, completion: @escaping (PreviewMovieModel?, NetworkError?) -> Void) {
        NetworkManager().fetchData(model: PreviewMovieModel.self, endpoint: .showMovie(id: id)) { response in
            switch response {
            case .success(let showedMovieResponse):
                if let showedMovie = showedMovieResponse {
                    completion(showedMovie, nil)
                } else {
                    completion(nil, NetworkError.failedToGetData)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    
    
}
