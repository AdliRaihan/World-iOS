//
//  LeftHeaderTableViewCell.swift
//  World
//
//  Created by APCMBP001 on 21/02/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit

class LeftHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var header : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        header.text = "Adli Raihan"
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
