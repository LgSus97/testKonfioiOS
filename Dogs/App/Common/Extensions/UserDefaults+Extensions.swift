//
//  UserDefaults+Extensions.swift
//  Dogs
//
//  Created by Jesus Loaiza Herrera on 27/03/22.
//

import Foundation


extension UserDefaults{
  
  //MARK: - Save Bool
  func saveBool(value: Bool,key:UserDefultsKeys){
    set(value, forKey: key.rawValue)
  }
  //MARK: - Retrieve Bool
  func getBool(key:UserDefultsKeys) -> Bool{
    return bool(forKey: key.rawValue)
  }

}


public enum UserDefultsKeys : String {
  case isApiAlreadyCallOnce
}
