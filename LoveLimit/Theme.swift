//
//  Theme.swift
//  LoveLimit
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 zzj. All rights reserved.
//

import Foundation
import UIKit

let screenWidth = UIScreen.mainScreen().bounds.width
let screeenHeight = UIScreen.mainScreen().bounds.height
let rate = screenWidth/320.0
let navBarHeight:CGFloat = 64
let tabBarHeight:CGFloat = 49

//定义字体
let fontLevelOne:CGFloat = 24
let fontLevelTwo:CGFloat = 20
let fontLevelThree:CGFloat = 18
let fontLevelFour:CGFloat = 16
let fontLevelFive:CGFloat = 14

//定义颜色 定义常出现的颜色
let colorTitle = UIColor.colorWith(R: 86, G: 177, B: 230)
//86 177 230
let colorGray = UIColor.colorWith(R: 134, G: 134, B: 134)

//URL
let urlLimitList = "http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=%ld"
let urlReducePrice = "http://iappfree.candou.com:8080/free/applications/sales?currency=rmb&page=%ld"
let urlAppFree = "http://iappfree.candou.com:8080/free/applications/free?currency=rmb&page=%ld"

//详情页面url
let urlDetail = "http://iappfree.candou.com:8080/free/applications/%@?currency=rmb"
//周边的url
let urlNearBy = "http://iappfree.candou.com:8080/free/applications/recommend?longitude=116.344539&latitude=40.034346"
















