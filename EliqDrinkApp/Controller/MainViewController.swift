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
    private var drinks = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.rowHeight = 300;
        drinks = [1,2,3,4,5]
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.drinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.identifierNameForDrinkItemCell, for: indexPath) as! DrinkItemCell
        //let resume = self.resumes[indexPath.row] as ResumeViewModel
        //cell.title.text = resume.title
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


