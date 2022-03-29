//
//  DogsViewModel.swift
//  Dogs
//
//  Created by Jesus Loaiza Herrera on 26/03/22.
//

import Foundation
import RealmSwift

class DogsViewModel: ViewModelBase, DogsViewModelProtocol {
  
  var dogs: Dynamic<[Dogs]>
  
  private let repository = DogsRepository()

  
  override init(){
    self.dogs = Dynamic([Dogs()])
  }
  
  
  func serviceDogs() {
    repository.serviceDogs(completion: {  [unowned self] result in
      switch result{
      case .success(let response):
        print("response \(response)")
      
        if response.count > 0{
          dogs.value = response
        } else{
          let error: NSAppError = NSAppError.returnErrorByCode(code: ErrorCode.generic.rawValue, value: ErrorKey.generic.rawValue , request: .dogs)
          self.requestAnswer.value = (success: false, request: .dogs, error: error)
        }
        
      case .failure(let error):
        print(error)
        self.requestAnswer.value = (success: false, request: .dogs, error: error)
      }
      
    })
  }
  
}
