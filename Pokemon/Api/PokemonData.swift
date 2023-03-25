//
//  PokemonData.swift
//  Pokemon
//
//  Created by Furkan Deniz Albaylar on 24.03.2023.
//

import Foundation

struct ApiData: Codable {
    let count: Int
    let next: String
    let results: [CharacterData]?
}

// MARK: - Result
struct CharacterData: Codable {
    let name: String?
    var url : String
    var image :URL?
    
    

}



