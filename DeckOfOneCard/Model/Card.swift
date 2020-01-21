//
//  Card.swift
//  DeckOfOneCard
//
//  Created by Devin Singh on 1/21/20.
//  Copyright © 2020 Devin Singh. All rights reserved.
//

import Foundation

struct TopLevelObject: Decodable {
    let cards: [Card]
}

struct Card: Decodable {
    let value: String
    let suit: String
    let image: URL
}



