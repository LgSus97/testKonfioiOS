//
//  Response.swift
//  Dogs
//
//  Created by Jesus Loaiza Herrera on 25/03/22.
//

import Foundation

class Response {
  var data: Data?
  
  var jsonData: [String:Any]? {
    if let responceData = data, let json = try? JSONSerialization.jsonObject(with: responceData, options: []) {
      return json as? [String:Any]
    }
    return nil
  }
  
  var arrayData: [Any]? {
    if let responceData = data, let array = try? JSONSerialization.jsonObject(with: responceData, options: []) {
      return array as? [Any]
    }
    return nil
  }
  
  init(data: Data?) {
    self.data = data
  }
}
