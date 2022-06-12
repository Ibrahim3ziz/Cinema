//
//  HomeRepo.swift
//  Cinema
//
//  Created by Ibrahim Abdul Aziz on 30/05/2022.
//

import Foundation
import UIKit

// MARK: - Enhancement needed.


protocol RepoInterFace {
    func getMostPopularMovies(page: Int, completion: @escaping([Movie], NetworkError?) -> Void)
    func getUpcomingMovies(page: Int, completion: @escaping ([Movie], NetworkError?) -> Void)
}

class RepoImplentation: RepoInterFace {
    
    func getMostPopularMovies(page: Int,completion: @escaping ([Movie], NetworkError?) -> Void) {
        NetworkManager().fetchData(model: MoviesResponse.self, endpoint: .popular(page: page)) { response in
            switch response {
            case .success(let mostPopularMoviesResponse):
                if let mostPopularMovies = mostPopularMoviesResponse?.results {
                    completion(mostPopularMovies, nil)
                } else {
                    completion([], NetworkError.failedToGetData)
                }
            case .failure(let error):
                    completion([], NetworkError.returnedError(error))
            }
        }
    }
    
    
    func getUpcomingMovies(page: Int, completion: @escaping ([Movie], NetworkError?) -> Void) {
        NetworkManager().fetchData(model: MoviesResponse.self, endpoint: .upCommingReleases(page: page)) { response in
            switch response {
            case .success(let upcomingMoviesResponse):
                if let upcomingMovies = upcomingMoviesResponse?.results {
                    completion(upcomingMovies, nil)
                } else {
                    completion([], NetworkError.failedToGetData)
                }
            case .failure(let error):
                completion([], NetworkError.returnedError(error))
            }
        }
    }
        
}

