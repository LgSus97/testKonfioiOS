//
//  TargetEnviroment.swift
//  Dogs
//
//  Created by Jesus Loaiza Herrera on 25/03/22.
//

import Foundation

public enum TargetEnvironment{
  
  enum Keys {
    enum Plist{
      static let appEndpoint = "APP_ENDPOINT"
    }
  }
  
  private static let infoDictionary: [String: Any] = {
    guard let dict = Bundle.main.infoDictionary else{
      fatalError("Plist not found")
    }
    return dict
  }()
  
  static let appEndpoint: String = {
    guard let appEndpoint = TargetEnvironment.infoDictionary[Keys.Plist.appEndpoint] as? String else{
      fatalError("appEndpoint not set")
    }
    return appEndpoint
  }()
  
}
