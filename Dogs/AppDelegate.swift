//
//  AppDelegate.swift
//  Dogs
//
//  Created by Jesus Loaiza Herrera on 25/03/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window : UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    UIViewController.swizzle()
    if #available(iOS 13.0, *) {
      let navButton = UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.self])
      navButton.setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .normal)
      navButton.setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .highlighted)
      window?.overrideUserInterfaceStyle = .light
    } else {
      // Fallback on earlier versions
    }
    guard #available(iOS 13.0, *) else { startApp(); return true}
    return true
  }
  
  func startApp(){
    window = UIWindow(frame: UIScreen.main.bounds)
    MainCoordinator.shared.setup(window: window)
    MainCoordinator.shared.start()
  }

  // MARK: UISceneSession Lifecycle

  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
  }


}

