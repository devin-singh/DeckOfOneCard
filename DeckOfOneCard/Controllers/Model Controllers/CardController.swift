//
//  CardController.swift
//  DeckOfOneCard
//
//  Created by Devin Singh on 1/21/20.
//  Copyright © 2020 Devin Singh. All rights reserved.
//

import Foundation
import UIKit.UIImage

class CardController {
    
    static let endpoint = URL(string: "https://deckofcardsapi.com/api/deck/new/draw/?count=1")
    
    static func fetchCard(completion: @escaping (Result <Card, CardError>) -> Void) {
        // 1 - Prepare URL
        guard let endpoint: URL = endpoint else { return completion(.failure(.invalidURL)) }
        // 2 - Contact server
        URLSession.shared.dataTask(with: endpoint) { (data, _, error) in
            // 3 - Handle errors from the server
            if let error = error {
                completion(.failure(.thrownError(error)))
            }
            // 4 - Check for json data
            guard let data = data else { return completion(.failure(.noData))}
            // 5 - Decode json into a Card
            do {
                let topLevelObj: TopLevelObject = try JSONDecoder().decode(TopLevelObject.self, from: data)
                completion(.success(topLevelObj.cards[0]))
            } catch {
                return completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
    
    static func fetchImage(for card: Card, completion: @escaping (Result <UIImage, CardError>) -> Void) {

      // 1 - Prepare URL
        let imageURL = card.image
      // 2 - Contact server
        URLSession.shared.dataTask(with: imageURL) { (data, _, error) in
            // 3 - Handle errors from the server
            if let error = error {
                completion(.failure(.thrownError(error)))
            }
            // 4 - Check for image data
            guard let data = data else { return completion(.failure(.noData))}
            // 5 - Initialize an image from the data
            guard let image = UIImage(data: data) else { return completion(.failure(.unableToDecode))}
            
            completion(.success(image))
            
        }.resume()
    }
}
