//
//  RealmService.swift
//  Dogs
//
//  Created by Jesus Loaiza Herrera on 27/03/22.
//

import Foundation
import RealmSwift

class RealmService {
  
  private init() {}
  static let shared = RealmService()
  
  var realm = try! Realm()
  
/*  func create(_ objects: [Object]) {
    do{
      try realm.write {
        realm.add(objects)
      }
    }catch{
      post(error)
    }
  }*/
  
  func create<T: Object>(_ object: T){
    do{
      try realm.write{
        realm.add(object)
      }
    
    }catch{
      post(error)
    }
  }
  
  
  func delete<T: Object>(_ object: T){
    do{
      try realm.write{
        realm.delete(object)
      }
    
    }catch{
      post(error)
    }
  }
  
  func post(_ error: Error){
    NotificationCenter.default.post(name: NSNotification.Name("RealmError"), object: error)
  }
  
  func observeRealmErrors(in vc: UIViewController, completion: @escaping (Error?) -> Void){
    NotificationCenter.default.addObserver(forName: NSNotification.Name("RealmError"), object: nil, queue: nil, using: {
      (notification) in
      completion(notification.object as? Error)
    })
  }
  
  func stopObservingErrors(in vc: UIViewController){
    NotificationCenter.default.removeObserver(vc, name: NSNotification.Name("RealmError"), object: nil)
  }
}
