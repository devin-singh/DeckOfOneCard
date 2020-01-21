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
}
