//
//  DetailViewController.swift
//  Pokemon
//
//  Created by Furkan Deniz Albaylar on 24.03.2023.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {

    
    @IBOutlet weak var abiltyName: UILabel!
    @IBOutlet weak var pokemonWeight: UILabel!
    @IBOutlet weak var pokemonHeight: UILabel!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonDetaiImage: UIImageView!
    //var detail : PokemonDetails?
    var detail: PokemonDetails?
    var item: ListModel?
    
    
    //var item : ListModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateData()
        pokemonNameLabel.layer.masksToBounds = true
        pokemonNameLabel.layer.cornerRadius = 80
        pokemonNameLabel.layer.borderWidth = 5.0
        pokemonNameLabel.layer.borderColor = UIColor.systemYellow.cgColor
    }
    func updateData(){
        pokemonNameLabel.text = "\(detail?.name ?? "")"
        pokemonHeight.text = "Height : \(detail?.height ?? 0)"
        pokemonWeight.text = "Weight : \(detail?.weight ?? 0)"
        abiltyName.text = "Abilities: " + (detail?.abilities.compactMap({$0.ability.name}).joined(separator: ", ") ?? "")

        
        pokemonDetaiImage.kf.setImage(with:item?.images )
        
    }

}
