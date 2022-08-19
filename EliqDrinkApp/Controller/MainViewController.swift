//
//  ViewController.swift
//  EliqDrinkApp
//
//  Created by ReliSource Technologies Ltd. on 8/19/22.
//

import UIKit

class MainViewController: UIViewController, Storyboarded {
    @IBOutlet weak var tableView: UITableView!
    weak var coordinator: MainCoordinator?
    private var drinks = [DrinkViewModel]()
    
    var fetchedResults: [Drink]? {
        didSet {
            guard let results = fetchedResults else { return }
            drinks = results.map{DrinkViewModel.init(drink: $0)}
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.rowHeight = 300;
        fetchDrinks()
    }
}

extension MainViewController {
    private func fetchDrinks() {
        //guard let resumes = dbManager.getAllResume() else { return }
        //self.fetchedResults = resumes
        drinks.append(DrinkViewModel(drink: Drink(idDrink: "2", strDrink:"cheetah", strDrinkThumb: "cheetah")))
        drinks.append(DrinkViewModel(drink: Drink(idDrink: "2", strDrink:"zebra", strDrinkThumb: "zebra")))
        drinks.append(DrinkViewModel(drink: Drink(idDrink: "2", strDrink:"cheetah", strDrinkThumb: "cheetah")))
        drinks.append(DrinkViewModel(drink: Drink(idDrink: "2", strDrink:"zebra", strDrinkThumb: "zebra")))
        drinks.append(DrinkViewModel(drink: Drink(idDrink: "2", strDrink:"cheetah", strDrinkThumb: "cheetah")))
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.drinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.identifierNameForDrinkItemCell, for: indexPath) as! DrinkItemCell
        let drink = self.drinks[indexPath.row] as DrinkViewModel
        cell.drinkImage.image = UIImage.init(named: drink.thumbUrl)
        cell.label.text = drink.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let selectedCell = tableView.cellForRow(at: indexPath)
        coordinator?.goToDetailsView()
    }
    
    //    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    //        if editingStyle == .delete {
    //            let resumeViewModel = self.resumes[indexPath.row] as ResumeViewModel
    //            tableView.beginUpdates()
    //            if self.dbManager.deleteResume(byIdentifier: resumeViewModel.resume.id) {
    //                self.resumes.remove(at: indexPath.row)
    //                tableView.deleteRows(at: [indexPath], with: .automatic)
    //            }
    //            tableView.endUpdates()
    //        }
    //    }
}


