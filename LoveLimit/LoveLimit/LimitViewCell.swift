//
//  LimitViewCell.swift
//  LoveLimit
//
//  Created by qianfeng on 16/10/8.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class LimitViewCell: UITableViewCell {

    @IBOutlet weak var starview: StarView!
    @IBOutlet weak var LineLabel: UILabel!
    @IBOutlet weak var CurrentPriceLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var CategoryNameLabel: UILabel!
    @IBOutlet weak var LastPriceLabel: UILabel!
    @IBOutlet weak var DownloadsLabel: UILabel!
    @IBOutlet weak var FavoritesLabel: UILabel!
    @IBOutlet weak var SharesLabel: UILabel!
    @IBOutlet weak var AppBGImage: UIImageView!
    @IBOutlet weak var AppIconImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
