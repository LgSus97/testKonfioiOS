//
//  AppDogs.swift
//  Dogs
//
//  Created by Jesus Loaiza Herrera on 25/03/22.
//

import Alamofire

class AppDogs: Requestable{
  func error(from data: AFError) -> NSAppError {
    return AppError.generic
  }
  
  func dogs(completion: @escaping (Result<[Dogs], NSAppError>) -> Void){
    perform(request: DogsRouter.dogs(.https), completion: {  result in
      
      switch result{
      case .success(let response):
        guard let data = response.data, let responseDogs = try? JSONDecoder().decode([Dogs].self, from: data) else {
          completion(.failure(AppError.errorForParseFailed))
          return
        }
        completion(.success(responseDogs))
      case .failure(let error):
        completion(.failure(error))
      }
    })
    
  }
  
}
