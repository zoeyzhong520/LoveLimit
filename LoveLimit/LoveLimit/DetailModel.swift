//
//  DetailModel.swift
//  LoveLimit
//
//  Created by qianfeng on 16/9/27.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class DetailModel: NSObject {
    var applicationId:String!
    var appurl:String!
    var categoryId:NSNumber!
    var categoryName:String!
    var currentPrice:String!
    var currentVersion:String!
    var description1:String!
    var description_long:String!
    var downloads:String!
    var expireDatetime:String!
    var fileSize:String!
    var iconUrl:String!
    var itunesUrl:String!
    var language:String!
    var lastPrice:String!
    var name:String!
    var newversion:String!
    var priceTrend:String!
    var ratingOverall:String!
    var releaseDate:String!
    var releaseNotes:String!
    var sellerId:String!
    var sellerName:String!
    var slug:String!
    var starCurrent:String!
    var starOverall:String!
    var systemRequirements:String!
    var updateDatef:String!
    var photos:[[String:String]]!
    override func setValue(value: AnyObject?, forKey key: String) {
        if key != "description" {
            super.setValue(value, forKey: key)
        }else{
            description1 = value as! String
        }
    }

    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}










