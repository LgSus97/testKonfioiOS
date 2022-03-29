//
//  Requestable.swift
//  Dogs
//
//  Created by Jesus Loaiza Herrera on 25/03/22.
//

import Foundation
import Alamofire


// MARK: - API Helpers. Result enumeration
///    Custom response for service closures
///  - success: Success service call
///  - failure: Fail service call with error description
typealias RequestResponse = (Result<Response, NSAppError>) -> Void

typealias RequestAnswer = (success: Bool, request: APIRequests, error:NSAppError?)

// MARK: - Requestable protocol extension
/// Protocol for generic services objects
protocol Requestable {
  /// Returns a NSError from custom Data in body response
  /// - Parameters:
  ///     - from: Data from body response
  func error(from data: AFError) -> NSAppError
}

// MARK: - Requestable protocol extension
/// Protocol extension with custom perform method definition

extension Requestable {
  
  func perform(request: URLRequestConvertible, logResponse: Bool = true, completion: @escaping RequestResponse) {
    let request = AF.request(request).validate()
    
    print(request)
    request.response { responseData in
    
      print("responseData --- ")
      
      guard let response = responseData.response else {
        print("responseData --- AppError.callService ")
        completion(.failure(AppError.callService))
        return
      }
      
      ///  log response
      if let value = responseData.value, logResponse {
        print();print()
        print("== SERVER RESPONSE ==")
        print(request.request?.url ?? ""); print("statusCode: \(response.statusCode)")
        guard let data = value else { return }
        let dataText = String(decoding: data, as: UTF8.self)
        print(dataText)
        print();print();
      }
      
      if let headerFields = responseData.response?.allHeaderFields as? [String: String], let URL = responseData.request?.url {
        let cookies = HTTPCookie.cookies(withResponseHeaderFields: headerFields, for: URL)
        print(cookies)
        if cookies.count >= 1 {
          AF.session.configuration.httpCookieStorage?.setCookie(cookies.first!)
        }
      }
      
      
      switch responseData.result {
      case .success:
        let sessionResponse = Response(data: responseData.data)
        completion(.success(sessionResponse))
      case .failure(let AFError):
        #if DEBUG
        debugPrint("    Error: --- \(AFError.localizedDescription)")
        #endif
        completion(.failure(AppError.callError))
      }
    }
  }
}


