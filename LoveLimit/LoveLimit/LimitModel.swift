//
//  LimitModel.swift
//  LoveLimit
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class LimitModel: NSObject {
    var categoryName:String?
    var downloads:String!
    var expireDatetime:String?
    var favorites:String!
    var iconUrl:String?
    var lastPrice:String!
    var name:String?
    var shares:String!
    var applicationId:String?
    var categoryId:NSNumber?
    var currentPrice:String!
    var description1:String?
    var fileSize:String?
    var ipa:String?
    var itunesUrl:String?
    var priceTrend:String?
    var ratingOverall:String?
    var releaseDate:String?
    var releaseNotes:String?
    var slug:String?
    var starCurrent:String!
    var starOverall:String?
    var updateDate:String?
    var version:String?
    override func setValue(value: AnyObject?, forKey key: String) {
        if key != "description" {
            super.setValue(value, forKey: key)
        }else{
            description1 = value as? String
        }
    }

    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}
















