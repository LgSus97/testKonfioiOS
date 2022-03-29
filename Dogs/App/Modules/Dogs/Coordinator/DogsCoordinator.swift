//
//  DogsCoordinator.swift
//  Dogs
//
//  Created by Jesus Loaiza Herrera on 27/03/22.
//

import UIKit

class DogsCoordinator: Coordinator {
  
  var childCoordinators: [Coordinator]
  
  var navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    childCoordinators = []
    self.navigationController = navigationController
    self.navigationController.whitheStyle()
    
  }
  
  func start() {
    
  }

}

