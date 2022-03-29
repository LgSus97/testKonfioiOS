//
//  OptionDog.swift
//  Dogs
//
//  Created by Jesus Loaiza Herrera on 26/03/22.
//

import UIKit

class OptionDog: UIView {
  
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var imgView: UIImageView!
  @IBOutlet weak var nameLbl: UILabel!
  @IBOutlet weak var descriptionLbl: UILabel!
  @IBOutlet weak var ageLbl: UILabel!
  
  
  @IBOutlet weak var subContainerView: UIView!
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  func commonInit(){
    let viewFromXib = Bundle.main.loadNibNamed("OptionDog", owner: self, options: nil)![0] as! UIView
    viewFromXib.frame = self.bounds
    setTextAndStyles()
    addSubview(viewFromXib)
  }
  
  func setTextAndStyles(){
    containerView.isUserInteractionEnabled = false
    
    subContainerView.backgroundColor = .white
    subContainerView.roundCorners(corners: [.topRight,.bottomRight], radius: 20.0)
    
    nameLbl.darkTitle()
    
    descriptionLbl.graySubTitle()
    descriptionLbl.lineBreakMode = .byTruncatingHead
    descriptionLbl.numberOfLines = 0
    descriptionLbl.adjustsFontSizeToFitWidth = false
    descriptionLbl.textAlignment = .left
    
    ageLbl.darkNormal()
  }
  
}
