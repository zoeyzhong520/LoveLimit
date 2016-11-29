//
//  StarView.swift
//  LoveLimit
//
//  Created by qianfeng on 16/9/27.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class StarView: UIView {
    private let width:CGFloat = 65
    private let height:CGFloat = 23
    private let bgImageView:UIImageView = UIImageView(image: UIImage(named: "StarsBackground.png"))
    private let currentImageView:UIImageView = UIImageView(image: UIImage(named: "StarsForeground.png"))
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: frame.origin.x, y: frame.origin.y, width: width, height: height))
        configStar()
    }
    
    /*在xib中加入的视图，创建的时候会调用下面的方法
     */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configStar()
    }
    
    func configStar() {
        bgImageView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        addSubview(bgImageView)
        currentImageView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        currentImageView.contentMode = .Left
        currentImageView.clipsToBounds = true
        addSubview(currentImageView)
    }

    func setStar(num:CGFloat) {
        currentImageView.frame.size.width = width*num/5.0
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
