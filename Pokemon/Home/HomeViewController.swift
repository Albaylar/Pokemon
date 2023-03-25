//
//  ViewController.swift
//  Pokemon
//
//  Created by Furkan Deniz Albaylar on 24.03.2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    typealias RowItem = ListModel
    private var items: [RowItem] = []
    private let viewModel = ListViewModel()
    private let detailviewmodel = DetailModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setUpBindings()
        viewModel.didViewLoad()
   
    }
    
    private func setupTableView() {
      tableView?.register(.init(nibName: "PokemonTableViewCell", bundle: nil), forCellReuseIdentifier: "PokemonTableViewCell")
      tableView?.delegate = self
      tableView?.dataSource = self
    
    }
    private func setUpBindings()  {
        self.viewModel.onErrorDetected = { [weak self] message in
            let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self?.present(alertController, animated: true)
        }
        
        self.viewModel.refreshItems = { [weak self] items in
            self?.setItems(items)
        }
    }
    func setItems(_ items: [RowItem]) {
      self.items = items
      tableView?.reloadData()
    }


}

extension HomeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.itemPressed(indexPath.row)
        
    }
    
}
extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonTableViewCell") as! PokemonTableViewCell
        
        cell.configure(with: items[indexPath.row])
        
        cell.button = { [unowned self] in
            let selectedRow = indexPath.row
            let selectedModel = self.items[selectedRow]
            
            self.detailviewmodel.fetchDetails(for: selectedModel) { result in
                switch result {
                case .success(let details):
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                    vc.detail = details
                    vc.item = selectedModel
                    self.present(vc, animated: true, completion: nil)
                case .failure(let error):
                    print("Error fetching details: \(error)")
                }
            }
        }
        
        return cell
    }


    
}

