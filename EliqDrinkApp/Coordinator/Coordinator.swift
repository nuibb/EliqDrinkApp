//
//  Coordinator.swift
//  EliqDrinkApp
//
//  Created by ReliSource Technologies Ltd. on 8/19/22.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
