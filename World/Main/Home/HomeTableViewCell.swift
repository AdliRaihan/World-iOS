//
//  HomeTableViewCell.swift
//  World
//
//  Created by APCMBP001 on 20/02/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelHeader: UILabel!
    @IBOutlet weak var imageHolder: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
