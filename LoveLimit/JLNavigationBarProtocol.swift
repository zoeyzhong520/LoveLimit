//
//  JLNavigationBarProtocol.swift
//  LoveLimit
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 zzj. All rights reserved.
//

import Foundation
import UIKit

enum BarButtonPosition {
    case left
    case right
}

protocol JSNavigationProtocol:NSObjectProtocol {
    func addTitle(title:String)
    func addButton(title:String?,imageName:String?,bgImageName:String?,position:BarButtonPosition,select:Selector)
}

extension JSNavigationProtocol where Self:UIViewController {
    func addTitle(title:String) {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        label.font = UIFont.boldSystemFontOfSize(fontLevelOne)
        label.textColor = colorTitle
        label.textAlignment = .Center
        label.text = title
        navigationItem.titleView = label
    }
    
    func addButton(title: String?=nil, imageName: String?=nil, bgImageName: String?=nil, position: BarButtonPosition,select:Selector) {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 44))
        if title != nil {
            button.setTitle(title, forState: .Normal)
        }
        if imageName != nil {
            button.setImage(UIImage(named: imageName!), forState: .Normal)
        }
        if bgImageName != nil {
            button.setBackgroundImage(UIImage(named: bgImageName!), forState: .Normal)
        }
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.setTitleColor(colorGray, forState: .Highlighted)
        button.addTarget(self, action: select, forControlEvents: .TouchUpInside)
        let barButtonItem = UIBarButtonItem(customView: button)
        if position == .left {
            if navigationItem.leftBarButtonItems != nil {
                navigationItem.leftBarButtonItems = navigationItem.leftBarButtonItems!+[barButtonItem]
            }else{
                navigationItem.leftBarButtonItems = [barButtonItem]
            }
        }else{
            if navigationItem.rightBarButtonItems != nil {
                navigationItem.rightBarButtonItems = navigationItem.rightBarButtonItems!+[barButtonItem]
            }else{
                navigationItem.rightBarButtonItems = [barButtonItem]
            }
        }
    }
}











