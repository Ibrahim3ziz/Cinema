//
//  NetworkError.swift
//  Cinema
//
//  Created by Ibrahim Abdul Aziz on 06/06/2022.
//

import Foundation

enum NetworkError: Error {
    case failedToGetData
    case badNetwork
    case errorParsingJson
    case returnedError(Error)
    case unkownError
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .failedToGetData:
            return " "
        case .badNetwork:
            return " "
        case .errorParsingJson:
            return "Failed to parse Jsosn data"
        case .returnedError(let error):
            return "\(error)"
        case .unkownError:
            return "Unkown error occured."
        }
    }
}

