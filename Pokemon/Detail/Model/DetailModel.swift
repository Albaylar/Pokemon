//
//  DetailModel.swift
//  Pokemon
//
//  Created by Furkan Deniz Albaylar on 24.03.2023.
//

import Foundation
import Alamofire
import UIKit

class DetailModel {
    func fetchDetails(for item: ListModel, completion: @escaping (Result<PokemonDetails, Error>) -> Void) {
        AF.request(item.url).validate().responseDecodable(of: PokemonDetails.self) { response in
            switch response.result {
            case .success(let details):
                completion(.success(details))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
