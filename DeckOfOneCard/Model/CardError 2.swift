//
//  CardError.swift
//  DeckOfOneCard
//
//  Created by Devin Singh on 1/21/20.
//  Copyright © 2020 Devin Singh. All rights reserved.
//

import Foundation


enum CardError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Unable to reach the server"
        case .thrownError(let error):
            return error.localizedDescription
        case .noData:
            return "The server responded with no data"
        case .unableToDecode:
            return "The server responded with bad data"
        }
    }
}
