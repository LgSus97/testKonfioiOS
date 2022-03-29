//
//  ProtocolBase.swift
//  Dogs
//
//  Created by Jesus Loaiza Herrera on 26/03/22.
//

import Foundation

protocol  ProtocolBase : AnyObject {
  
  var errorHandle:((_ error:NSAppError?,_ service:String)->Void)? { set  get }
  
  var requestAnswer: Dynamic<RequestAnswer> { get set }
  
  func launchError(_ error:NSAppError?,_ service:String)
}
