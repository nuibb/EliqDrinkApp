//
//  ApiError.swift
//  EliqDrinkApp
//
//  Created by ReliSource Technologies Ltd. on 8/20/22.
//

import Foundation

enum ApiError: Error {
    case statusCode
    case decoding(description: String)
    case invalidImage
    case invalidURL(description: String)
    case network(description: String)
    case offline
    case other(Error)
    
    static func map(_ error: Error) -> ApiError {
        return (error as? ApiError) ?? .other(error)
    }
}
