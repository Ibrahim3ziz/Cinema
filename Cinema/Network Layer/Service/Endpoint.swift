//
//  Endpoint.swift
//  Cinema
//
//  Created by Ibrahim Abdul Aziz on 17/05/2022.
//


import Foundation

// https://api.themoviedb.org/3/movie/{movie_id}?api_key=<<api_key>>&language=en-US
// https://api.themoviedb.org/3/movie/338953?api_key=44635efe282a17fbb40e48b01141f5b4&language=en-US
// 338953
struct Constants {
    static let baseURL = "https://api.themoviedb.org"
    static let API_KEY = "44635efe282a17fbb40e48b01141f5b4"
}


enum Endpoint {
    case popular(page: Int)
    case upCommingReleases(page: Int)
    case search(query: String)
    case showMovie(id: Int)
}


extension Endpoint {
    
    var url: URL {
        switch self {
        case .popular(let page):
            let modifiedURL = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)")!
            let paginatedURL = modifiedURL.appending("page", value: "\(page)")
            return paginatedURL
//            return URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)")!
        case .upCommingReleases(let page):
            let modifiedURL = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)")!
            let paginatedURL = modifiedURL.appending("page", value: "\(page)")
            return paginatedURL
//            return URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)")!
        case .search(let query):
            return URL(string: "\(Constants.baseURL)/3/search/movie?api_key=\(Constants.API_KEY)&query=\(updateQuery(query))")!
        case .showMovie(let id):
            return URL(string: "\(Constants.baseURL)/3/movie/\(id)?api_key=\(Constants.API_KEY)&language=en-US")!
        }
    }


    private func updateQuery(_ query: String) -> String {
        let modifiedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)?.replacingOccurrences(of: " ", with: "+")
        return modifiedQuery!
    }
}

//        let paginatedURL = endpoint.url.appending("page", value: "\(page)")


extension URL {

    func appending(_ queryItem: String, value: String?) -> URL {

        guard var urlComponents = URLComponents(string: absoluteString) else { return absoluteURL }

        // Create array of existing query items
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []

        // Create query item
        let queryItem = URLQueryItem(name: queryItem, value: value)

        // Append the new query item in the existing query items array
        queryItems.append(queryItem)

        // Append updated query items array in the url component object
        urlComponents.queryItems = queryItems

        // Returns the url from new url components
        return urlComponents.url!
    }
}
