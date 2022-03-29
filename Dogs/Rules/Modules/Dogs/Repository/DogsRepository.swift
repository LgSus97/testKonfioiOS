//
//  DogsRepository.swift
//  Dogs
//
//  Created by Jesus Loaiza Herrera on 26/03/22.
//

import Foundation

class DogsRepository: DogsRepositoryProtocol {  
  
  func serviceDogs(completion: @escaping (Result<[Dogs], NSAppError>) -> Void) {
    let dogsLine = AppDogs()
    dogsLine.dogs(completion: { result in
      completion(result)
    })
  }
  
}
