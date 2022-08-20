//
//  ViewController.swift
//  EliqDrinkApp
//
//  Created by ReliSource Technologies Ltd. on 8/19/22.
//

import UIKit
import Combine

class MainViewController: UIViewController, Storyboarded {
    @IBOutlet weak var tableView: UITableView!
    
    private var cancellable: AnyCancellable!
    private var drinks = [DrinkViewModel]()
    weak var coordinator: MainCoordinator?
    private let apiService = ApiService(apiFetcher: ApiFetcher(), networkMonitor: NetworkMonitor.shared)
    
    var fetchedResults: [DrinkViewModel]? {
        didSet {
            guard let results = fetchedResults else { return }
            drinks = results
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.rowHeight = 300;
        self.cancellable = self.apiService.$dataSource.sink { response in
            self.fetchedResults = response
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.drinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.identifierNameForDrinkItemCell, for: indexPath) as! DrinkItemCell
        let drink = self.drinks[indexPath.row] as DrinkViewModel
        cell.drinkImage.load(url: URL(string: drink.thumbUrl)!)
        cell.label.text = drink.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let drink = self.drinks[indexPath.row] as DrinkViewModel
        coordinator?.goToDetailsView(id: drink.id)
    }
}


