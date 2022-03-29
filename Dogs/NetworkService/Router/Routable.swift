//
//  Routable.swift
//  Dogs
//
//  Created by Jesus Loaiza Herrera on 25/03/22.
//

import Foundation
import Alamofire

protocol Router {
  ///The body can be any type
  var baseURL: String { get }
  var httpProtocol: HttpProtocol { get }
  var path: String { get }
  var method: HTTPMethod { get }
  var parameters: Parameters? { get }
  var body: Parameters? { get }
  var bodystr: String? { get }
  var headers: HTTPHeaders? { get }
  var authField: String? { get }
}

protocol Routable: Router, URLRequestConvertible { }

extension Routable {
  //Note:- Default values
  
  var parameters: Parameters? {
    return nil
  }
  
  var headers: HTTPHeaders? {
    return nil
  }
  
  var authField: String? {
    return nil
  }
  
  var body: Parameters? {
    return nil
  }
  var bodystr: String? {
    return nil
  }
  
  var baseURL: String {
    return TargetEnvironment.appEndpoint
  }
  
  func asURLRequest() throws -> URLRequest {
    //Protocol
    let httpProtocol = self.httpProtocol.rawValue
    
    //URL
    let urlString = httpProtocol + baseURL
    var url = try urlString.asURL()
    url.appendPathComponent(path)
    
    //Request Method
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = method.rawValue
    urlRequest.timeoutInterval = 150 
    
    //Headers
    if let hFields = headers {
      for (header, value) in hFields.dictionary {
        urlRequest.setValue(value, forHTTPHeaderField: header)
      }
    }
    
    //Auths
    if let auth = authField {
      urlRequest.setValue(auth, forHTTPHeaderField: "Authorization")
    }
    
    //Params in body
    if let body = self.body, let bodyObject = try? JSONSerialization.data(withJSONObject: body, options: []) {
      urlRequest.httpBody = bodyObject
      //Print params
      if let text = String(data: bodyObject, encoding: String.Encoding.utf8) as String? {
        #if DEBUG
        debugPrint("param: \(text)")
        #endif
      }
    }
    return urlRequest
  }
}
