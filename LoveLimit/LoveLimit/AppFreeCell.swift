//
//  AppFreeCell.swift
//  LoveLimit
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class AppFreeCell: UITableViewCell {

    @IBOutlet weak var starview: StarView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var currentPriceLabel: UILabel!
    @IBOutlet weak var downloadsLabel: UILabel!
    @IBOutlet weak var favoritesLabel: UILabel!
    @IBOutlet weak var sharesLabel: UILabel!
    @IBOutlet weak var starCurrentLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var appBGImage: UIImageView!
    @IBOutlet weak var appIconImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
