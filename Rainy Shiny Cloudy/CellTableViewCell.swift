//
//  CellTableViewCell.swift
//  Rainy Shiny Cloudy
//
//  Created by Krystian Kopeć on 27.01.2017.
//  Copyright © 2017 Krystian Kopeć. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {

    
    
    @IBOutlet var weatherIconImage: UIImageView!
    
    @IBOutlet var dayLabel: UILabel!
    
    @IBOutlet var weatherLabel: UILabel!
    
    @IBOutlet var tempLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
