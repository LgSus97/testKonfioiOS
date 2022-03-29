//
//  UIColor+Definition.swift
//  Dogs
//
//  Created by Jesus Loaiza Herrera on 27/03/22.
//

import UIKit

extension UIColor {

  static var  grayGranite : UIColor { // #666666
    return UIColor(named: "GrayGranite") ?? .gray
  }

  static var dark : UIColor {         // #333333
    return UIColor(named: "Dark") ?? .dark
  }

  static var whiteGray : UIColor {    // #F8F8F8
    return UIColor(named: "WhiteGray") ?? .whiteGray
  }

}

extension UIColor {
  struct font {
    static var grayGranite : UIColor { return UIColor.grayGranite }
    static var dark : UIColor { return UIColor.dark }
    static var whiteGray : UIColor { return UIColor.whiteGray }
  }
    
}
