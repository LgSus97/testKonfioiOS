//
//  DogsRouter.swift
//  Dogs
//
//  Created by Jesus Loaiza Herrera on 25/03/22.
//

import Alamofire

enum DogsRouter: Routable{
  
  case dogs(HttpProtocol)

  
  var httpProtocol: HttpProtocol {
    switch self {
    case .dogs(let http):
      return http
    }
  }
  
  var path: String {
    switch self {
    case .dogs:
      return "/api/945366962796773376"
    }
  }
  
  var method: HTTPMethod {
    return .get
  }
  
  var headers: HTTPHeaders?{
    return ["Content-Type": "application/json"]
  }
  
  var body: Parameters?{
    switch self {
    case .dogs(_):
      return nil
    }
  }
}
