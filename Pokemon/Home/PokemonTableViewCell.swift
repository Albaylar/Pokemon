//
//  PokemonTableViewCell.swift
//  Pokemon
//
//  Created by Furkan Deniz Albaylar on 24.03.2023.
//

import UIKit
import Kingfisher

class PokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var pokemonImage: UIImageView!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tapButton: UIButton!
    
    var button: (() -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.nameLabel.layer.cornerRadius = 10
        self.nameLabel.layer.masksToBounds = true
        self.pokemonImage.layer.cornerRadius = 20
        self.pokemonImage.layer.masksToBounds = true
    }
    func configure(with model : ListModel) {
        nameLabel.text = model.name
        
        pokemonImage.kf.setImage(with:model.images)
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        button?()
    }
}

struct ListModel {
   // let id : String
    let name: String
    let url : String
    let images : URL?
    
    
    
}
