//
//  MainCoordinator.swift
//  Dogs
//
//  Created by Jesus Loaiza Herrera on 26/03/22.
//

import UIKit

class MainCoordinator: NSObject, Coordinator {
  
  
  
  // MARK: - Singleton
  static var shared = MainCoordinator()
  
  // MARK: - Properties
  var childCoordinators = [Coordinator]()
  var navigationController: UINavigationController = UINavigationController()
  
  // MARK: - Private Properties
  private var window: UIWindow?
  
  private override init() {}
  
  // MARK: - Public methods
  func setup(window: UIWindow?) {
    self.window = window
  }
  
  func start() {
    childCoordinators.removeAll()
    
    let dogsViewController = DogsViewController.instantiate(fromStoryboard: "Dogs")
    let dogsCoordinator = DogsCoordinator(navigationController: navigationController)
    let dogsViewModel = DogsViewModel()
    dogsViewController.setup(coordinator: dogsCoordinator,viewModel: dogsViewModel)
    childCoordinators.append(dogsCoordinator)
    navigationController.pushViewController(dogsViewController, animated: true)

    
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
    navigationController.whitheStyle()
    
  }
  
  
  func childDidFinish(_ child: Coordinator?) {
    for (index, coordinator) in childCoordinators.enumerated() {
      if coordinator === child {
        childCoordinators.remove(at: index)
        break
      }
    }
  }
  
  func popToLaucher(){
    self.navigationController.popViewController(animated: true)
    self.childCoordinators.removeLast()
  }
  
  
  /// Method to update root view controller of app window with  received view.
  /// - Parameter view: The new root module.
  func updateRoot(with view: UIViewController) {
    window?.rootViewController = view
  }
}
