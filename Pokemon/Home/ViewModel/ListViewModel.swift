//
//  ListViewModel.swift
//  Pokemon
//
//  Created by Furkan Deniz Albaylar on 24.03.2023.
//

import Foundation
import UIKit

class ListViewModel {
    private let model = PokemonModel()
    var onErrorDetected: ((String) -> ())?
    var refreshItems: (([ListModel]) -> ())?
    
    init() {
        model.delegate = self
    }
    
    func didViewLoad() {
        model.fetchData()
    }
    func itemPressed(_ index: Int) {
        let selectedItem = model.data[index]
        
    }

        
    }

extension ListViewModel: PokemonModelProtocol {
  
  func didLiveDataFetch() {
      let cellModels: [ListModel] = model.data.map{.init(name: $0.name ?? "",url: $0.url , images: $0.image)}
      for cellModel in cellModels {
          print(cellModel.url)
      } 
    refreshItems?(cellModels)
  }
  
  func didCacheDataFetch() {
     print("There is no CoreData ")
  }
  
  func didDataCouldntFetch() {
    onErrorDetected?("Please try again later !")
  }
}

