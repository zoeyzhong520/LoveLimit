//
//  JLTapView.swift
//  LoveLimit
//
//  Created by qianfeng on 16/9/27.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class JLTapView: UIView {
    var closure:((UIView)->())?
    init(frame: CGRect,iconUrlString:String,name:String,closure:((UIView)->())?) {
        super.init(frame: frame)
        let imageView = UIImageView(frame: CGRect(x: 5, y: 0, width: frame.size.width, height: frame.size.height-20))
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.kf_setImageWithURL(NSURL(string: iconUrlString))
        addSubview(imageView)
        
        let label = UILabel(frame: CGRect(x: 5, y: frame.size.width, width: frame.size.width, height: frame.size.height-frame.size.width))
        label.textColor = colorGray
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(9)
        label.text = name
        addSubview(label)
        
        if closure != nil {
            self.closure = closure
            let tap = UITapGestureRecognizer(target: self, action: #selector(tapClick(_:)))
            addGestureRecognizer(tap)
        }
    }
    
    func tapClick(tap:UITapGestureRecognizer) {
        closure!(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    
}
