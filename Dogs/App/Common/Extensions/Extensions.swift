//
//  Extensions.swift
//  Dogs
//
//  Created by Jesus Loaiza Herrera on 27/03/22.
//

import UIKit


extension UILabel{
  
  func setStyleBold(size: CGFloat, color: UIColor){
    self.font = UIFont.getBold(size: size)
    self.textColor = color
  }
  
  func setStyleSemiBold(size: CGFloat, color: UIColor){
    self.font = UIFont.getSemiBold(size: size)
    self.textColor = color
  }
  
  func setStyleMedium(size: CGFloat, color: UIColor){
    self.font = UIFont.getMedium(size: size)
    self.textColor = color
  }
  
  func setStyleRegular(size: CGFloat, color: UIColor){
    self.font = UIFont.getRegular(size: size)
    self.textColor = color
  }
  
  
  func darkTitle(){
    self.setStyleSemiBold(size: UIFont.sizes.title , color: UIColor.font.dark)
  }
  
  func graySubTitle(){
    self.setStyleRegular(size: UIFont.sizes.subTitle, color: UIColor.font.grayGranite)
  }
  
  func darkNormal(){
    self.setStyleMedium(size: UIFont.sizes.normal, color: UIColor.font.dark)
  }
  
}

extension UIView {
  func roundCorners(corners: UIRectCorner, radius: CGFloat) {
    let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    let mask = CAShapeLayer()
    mask.path = path.cgPath
    layer.mask = mask
  }
}

extension UIImage {
  func resized(to newSize: CGSize) -> UIImage {
    return UIGraphicsImageRenderer(size: newSize).image { _ in
      let hScale = newSize.height / size.height
      let vScale = newSize.width / size.width
      let scale = max(hScale, vScale) // scaleToFill
      let resizeSize = CGSize(width: size.width*scale, height: size.height*scale)
      var middle = CGPoint.zero
      if resizeSize.width > newSize.width {
        middle.x -= (resizeSize.width-newSize.width)/2.0
      }
      if resizeSize.height > newSize.height {
        middle.y -= (resizeSize.height-newSize.height)/2.0
      }
      
      draw(in: CGRect(origin: middle, size: resizeSize))
    }
  }
}



extension UINavigationController{
  
  func whitheStyle(){
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = UIColor(named: "WhiteGray") ?? .whiteGray
    
    appearance.titleTextAttributes  = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.darkGray]
    appearance.shadowColor = .clear
    
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    self.navigationBar.setValue(true, forKey: "hidesShadow")
    self.navigationBar.isTranslucent = false
    
    // Customizing our navigation bar
    navigationBar.tintColor = .darkGray
    navigationBar.standardAppearance = appearance
    navigationBar.scrollEdgeAppearance = appearance
  }
}


extension UIViewController {
  
  func showMessage(body:String, title:String){
    let alert = UIAlertController(title: title, message: body, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
    self.present(alert, animated: true)
  }
  
  static func swizzle() {
    let originalSelector1 = #selector(viewDidLoad)
    let swizzledSelector1 = #selector(swizzled_viewDidLoad)
    swizzling(UIViewController.self, originalSelector1, swizzledSelector1)
  }
  
  @objc open func swizzled_viewDidLoad() {
    if let _ = navigationController {
      if #available(iOS 14.0, *) {
        navigationItem.backButtonDisplayMode = .minimal
      } else {
        // Fallback on earlier versions
        navigationItem.backButtonTitle = ""
      }
    }
    swizzled_viewDidLoad()
  }
}

private let swizzling: (UIViewController.Type, Selector, Selector) -> Void = { forClass, originalSelector, swizzledSelector in
  if let originalMethod = class_getInstanceMethod(forClass, originalSelector), let swizzledMethod = class_getInstanceMethod(forClass, swizzledSelector) {
    let didAddMethod = class_addMethod(forClass, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
    if didAddMethod {
      class_replaceMethod(forClass, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
    } else {
      method_exchangeImplementations(originalMethod, swizzledMethod)
    }
  }
}
