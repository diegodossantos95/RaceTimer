//
//  TimeTableViewCell.swift
//  RaceTimer
//
//  Created by Diego dos Santos on 5/3/15.
//  Copyright (c) 2015 Diego dos Santos. All rights reserved.
//

import UIKit

class TimeTableViewCell: UITableViewCell {

    @IBOutlet weak var differenceTimeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
