//
//  NSAppError.swift
//  Dogs
//
//  Created by Jesus Loaiza Herrera on 25/03/22.
//

import Foundation


let CBServicesDomain = "com.appdogs.errors.service"

class NSAppError: NSError {
  var localizedTitle = ""
  
  public override var description: String {
    return self.localizedDescription
  }
  
  convenience init(localizedTitle: String? = nil,
                   localizedDescription: ErrorKey,
                   code: ErrorCode) {
    
    self.init(domain: CBServicesDomain, code: code.rawValue, userInfo: [NSLocalizedDescriptionKey: localizedDescription.rawValue])
    self.localizedTitle = localizedTitle ?? "Error"
  }
  
  convenience init(localizedTitle: String? = nil,
                   localizedDescription: String,
                   code: ErrorCode) {
    
    self.init(domain: CBServicesDomain, code: code.rawValue, userInfo: [NSLocalizedDescriptionKey: localizedDescription])
    self.localizedTitle = localizedTitle ?? "Error"
  }
  
  convenience init(rawDesc: String, rawCode: Int) {
    self.init(domain: CBServicesDomain, code: rawCode, userInfo: [NSLocalizedDescriptionKey: rawDesc])
    self.localizedTitle = rawDesc
  }
  
  static public func returnErrorByCode(code:Int, value:String, request:APIRequests) -> NSAppError {
    
    return NSAppError.init(rawDesc: value, rawCode: code)
  }
}
