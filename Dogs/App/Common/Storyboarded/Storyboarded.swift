//
//  Storyboarded.swift
//  Dogs
//
//  Created by Jesus Loaiza Herrera on 26/03/22.
//

import UIKit

protocol Storyboarded{
  static func instantiate(fromStoryboard nibName: String) -> Self
  
}

extension Storyboarded where Self: UIViewController {
  static func instantiate(fromStoryboard nibName: String) -> Self{
    let id = String(describing: self)
    let storyboard = UIStoryboard(name: nibName, bundle: Bundle.main)
    return storyboard.instantiateViewController(withIdentifier: id) as! Self
  }
}
