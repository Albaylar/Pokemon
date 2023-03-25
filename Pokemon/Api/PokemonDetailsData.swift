//
//  PokemonDetailsData.swift
//  Pokemon
//
//  Created by Furkan Deniz Albaylar on 24.03.2023.
//

import Foundation
import Alamofire

struct Api :Codable {
    let results : [PokemonDetails]
}
struct PokemonDetails: Codable {
    let abilities: [Ability]
    let height: Int
    let id: Int
    let name: String
    let sprites: Sprites
    let weight: Int
}

// MARK: - Ability
struct Ability: Codable {
    let ability: Species
    let isHidden: Bool

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
    }
}

// MARK: - Species
struct Species: Codable {
    let name: String
    let url: String
}

// MARK: - Sprites
class Sprites: Codable {
    let other: Other?
}

// MARK: - Other
struct Other: Codable {
    let home: Home
}
struct Home: Codable {
    let frontDefault: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}




