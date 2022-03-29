//
//  Validations.swift
//  Dogs
//
//  Created by Jesus Loaiza Herrera on 27/03/22.
//

import Foundation

class Validations : NSObject{
  
  static func isApiAlreadyCallOnce()->Bool{
    if UserDefaults.standard.getBool(key: .isApiAlreadyCallOnce) {
      print("API already called")
      return true
    } else {
      UserDefaults.standard.saveBool(value: true, key: .isApiAlreadyCallOnce)
      print("API call first time")
      return false
    }
  }
}
