//
//  ViewController.swift
//  EliqDrinkApp
//
//  Created by ReliSource Technologies Ltd. on 8/19/22.
//

import UIKit

class MainViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goBtnListener(_ sender: Any) {
        coordinator?.goToDetailsView()
    }
    
}

