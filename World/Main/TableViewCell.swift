//
//  TableViewCell.swift
//  World
//
//  Created by APCMBP001 on 18/02/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelNPM: UILabel?
    @IBOutlet weak var labelNama: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
