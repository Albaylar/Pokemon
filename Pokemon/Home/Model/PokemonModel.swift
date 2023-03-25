//
//  PokemonModel.swift
//  Pokemon
//
//  Created by Furkan Deniz Albaylar on 24.03.2023.
//

import Foundation
import Alamofire


protocol PokemonModelProtocol: AnyObject {
  
  func didLiveDataFetch()
  func didCacheDataFetch()
  func didDataCouldntFetch()
}

class PokemonModel {
    
    
    private(set) var data: [CharacterData] = []
    //private var pokemonId = 1
    weak var delegate: PokemonModelProtocol?
    
    func fetchData() {
        AF.request("https://pokeapi.co/api/v2/pokemon?limit=40").responseDecodable(of: ApiData.self) { (res) in
            guard let response = res.value else {
                self.delegate?.didDataCouldntFetch()
                return
            }
            self.data = response.results ?? []
            
            for index in 0..<self.data.count {
                let name = self.data[index].name
                guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(name ?? "")") else { continue }
                print(url)
                AF.request(url).responseDecodable(of: PokemonDetails.self) { (response) in
                    guard let pokemon = response.value else { return }
                    // Her bir veriye ait resim URL'sini veriye ekleyin
                    if let imageUrlString = pokemon.sprites.other?.home.frontDefault,
                        let imageUrl = URL(string: imageUrlString) {
                        print(imageUrl)
                        self.data[index].image = imageUrl
                        self.delegate?.didLiveDataFetch()
                    } else {
                        // Hata durumu
                        self.delegate?.didDataCouldntFetch()
                    }
                }
            }
        }
    }



    

   // func fetchDataImage(url:URL) {
    //     if let lastPathComponent = url.pathComponents.last {
    //          let id = Int(lastPathComponent)
    //          print(id)
            
    //      AF.request("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png").responseDecodable(of: Api.self) { (res) in
    //             guard
    //                let response = res.value
    //            else {
    //                self.delegate?.didDataCouldntFetch()
    //                return
    //            }
    //            self.delegate?.didLiveDataFetch()
    //
    //        }
            
            
            
    //      }

    
    //   }
}

