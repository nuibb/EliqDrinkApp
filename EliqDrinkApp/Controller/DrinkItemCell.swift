//
//  DrinkItemCell.swift
//  EliqDrinkApp
//
//  Created by ReliSource Technologies Ltd. on 8/20/22.
//

import UIKit

class DrinkItemCell: UITableViewCell {
    @IBOutlet weak var drinkImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
