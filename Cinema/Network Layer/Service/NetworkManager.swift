//
//  APIManager.swift
//  Cinema
//
//  Created by Ibrahim Abdul Aziz on 17/05/2022.
//


import Foundation


class NetworkManager {
    static let shared = NetworkManager()

    func fetchData<T: Codable>(model: T.Type, endpoint: Endpoint, completion: @escaping (Result<T?, NetworkError>) -> Void) {
        
        let task = URLSession.shared.dataTask(with: endpoint.url) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(NetworkError.returnedError(error!)))
                return
            }
            
            do {
                let results = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(results))
                }
            }
            catch {
                DispatchQueue.main.async {
                    completion(.failure(NetworkError.errorParsingJson))
                }
            }
        }
        task.resume()
    }
    

}


