//
//  AppError.swift
//  Dogs
//
//  Created by Jesus Loaiza Herrera on 25/03/22.
//

import Foundation

struct AppError {
  static let generic = NSAppError(localizedDescription: ErrorKey.generic, code: ErrorCode.generic)
  
  static let callError = NSAppError(localizedDescription: ErrorKey.generic, code: ErrorCode.generic)
  
  static let callService = NSAppError(localizedDescription: ErrorKey.generic, code: ErrorCode.generic)
  
  static let errorForParseFailed = NSAppError(localizedDescription: ErrorKey.generic, code: ErrorCode.generic)
}
