//
//  MainCoordinator.swift
//  EliqDrinkApp
//
//  Created by ReliSource Technologies Ltd. on 8/19/22.
//

import Foundation
import UIKit
import SwiftUI

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        //navigationController.navigationBar.prefersLargeTitles = true
        let mainViewController = MainViewController.instantiate()
        mainViewController.coordinator = self
        mainViewController.title = Constants.navigationTitle
        navigationController.pushViewController(mainViewController, animated: false)
    }
    
    func goToDetailsView(id: Int) {
        let viewModel = DetailsViewModel(drinkId: id)
        let detailsView = UIHostingController(rootView: DetailsView(viewModel: viewModel))
        navigationController.pushViewController(detailsView, animated: true)
    }
}
