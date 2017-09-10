//
//  MealTableViewCell.swift
//  firstApp
//
//  Created by j0cker on 09/09/17.
//  Copyright © 2017 j0cker. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rating: RatingControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
