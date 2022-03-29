//
//  ItemDogsTableViewCell.swift
//  Dogs
//
//  Created by Jesus Loaiza Herrera on 26/03/22.
//

import UIKit

class ItemDogsTableViewCell: UITableViewCell {
  
  @IBOutlet weak var optionDog: OptionDog!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
