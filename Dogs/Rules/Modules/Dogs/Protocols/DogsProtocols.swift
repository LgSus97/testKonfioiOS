//
//  DogsProtocols.swift
//  Dogs
//
//  Created by Jesus Loaiza Herrera on 26/03/22.
//

import Foundation

protocol DogsRepositoryProtocol: AnyObject{
  func serviceDogs(completion: @escaping (Result<[Dogs], NSAppError>) -> Void)
}

protocol DogsViewModelProtocol: ProtocolBase{
  var dogs : Dynamic<[Dogs]> {set get}
  func serviceDogs()

}
