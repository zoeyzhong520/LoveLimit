//
//  DetailViewController.swift
//  LoveLimit
//
//  Created by qianfeng on 16/9/27.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class DetailViewController: UIViewController,JSNavigationProtocol {
    var footScrollView:UIScrollView!
    var footArray:[NearByModel] = []
    var headModel:DetailModel?
    var appImageView:UIImageView?
    var appName:UILabel?
    var appSome1:UILabel?
    var appSome2:UILabel?
    var appScrollView:UIScrollView?
    var appDetail:UILabel?
    var appId:String?
    let itunsUrl = "http://phobos.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=291586600&amp;mt=8"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        configUI()
        configFoot()
        loadData()
    }
    
    func configUI() {
        addTitle("应用详情")
        addButton("返回", position: .left, select: #selector(leftClick))
        configHead()
    }
    
    func leftClick() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func configHead() {
        let bgImageView = UIImageView(frame: CGRect(x: 10, y: navBarHeight+10, width: 300, height: 320))
        bgImageView.image = UIImage(named: "appdetail_background.png")
        view.addSubview(bgImageView)
        
        appImageView = UIImageView(frame: CGRect(x: 10, y: 15, width: 60, height: 60))
        bgImageView.addSubview(appImageView!)
        
        appName = UILabel(frame: CGRect(x: 80, y: 10, width: 200, height: 20))
        bgImageView.addSubview(appName!)
        
        appSome1 = UILabel(frame: CGRect(x: 80, y: 35, width: 200, height: 20))
        appSome1?.font = UIFont.systemFontOfSize(fontLevelFive)
        appSome1?.textColor = UIColor.grayColor()
        bgImageView.addSubview(appSome1!)
        
        appSome2 = UILabel(frame: CGRect(x: 80, y: 60, width: 200, height: 20))
        appSome2?.font = UIFont.systemFontOfSize(fontLevelFive)
        appSome2?.textColor = UIColor.grayColor()
        bgImageView.addSubview(appSome2!)
        
        let btnNames = ["分享","收藏","下载"]
        for i in 0..<btnNames.count {
            let btn = UIButton(frame: CGRect(x: 10+100*CGFloat(i), y: 160, width: 100, height: 30))
            btn.setTitle(btnNames[i], forState: .Normal)
            btn.setTitleColor(UIColor.init(red: 96/255, green: 119/255, blue: 154/255, alpha: 1.0), forState: .Normal)
            btn.setBackgroundImage(UIImage(named: "Detail_btn_left.png"), forState: .Normal)
            btn.addTarget(self, action: #selector(btnClick(_:)), forControlEvents: .TouchUpInside)
            btn.tag = 100+i
            view.addSubview(btn)
        }
        
        appScrollView = UIScrollView(frame: CGRect(x: 10, y: 130, width: 280, height: 75))
        appScrollView?.showsVerticalScrollIndicator = false
        bgImageView.addSubview(appScrollView!)
        
        appDetail = UILabel(frame: CGRect(x: 10, y: 210, width: 280, height: 100))
        appDetail?.numberOfLines = 0
        appDetail?.textColor = UIColor.grayColor()
        appDetail?.font = UIFont.systemFontOfSize(13)
        appDetail?.lineBreakMode = .ByCharWrapping
        bgImageView.addSubview(appDetail!)
    }
    
    func btnClick(btn:UIButton) {
        if btn.tag == 100 {
            
        }else if btn.tag == 101 {
            
        }else if btn.tag == 102 {
            /*UIApplication.sharedApplication().openURL(xxx)
             
             可以用来做app的跳转，跳到App Store、打电话／发短信等都可以用它
             */
            if headModel != nil {
                UIApplication.sharedApplication().openURL(NSURL(string:headModel!.itunesUrl)!)
            }
        }
    }
    
    func configFoot() {
        let bgImageView = UIImageView(frame: CGRect(x: 10, y: navBarHeight+10+320+10, width: 300, height: 105))
        bgImageView.image = UIImage(named: "appdetail_recommend.png")
        bgImageView.userInteractionEnabled = true
        view.addSubview(bgImageView)
        
        footScrollView = UIScrollView(frame: CGRect(x: 10, y: 30, width: 300, height: 65))
        footScrollView.showsVerticalScrollIndicator = false
        bgImageView.addSubview(footScrollView)
    }
    
    func loadData() {
        let urlString = String(format: urlDetail, appId!)
        Alamofire.request(.GET, urlString).responseJSON { [unowned self] (response) in
            if response.result.error == nil {
                //                print(response.result.value)
                self.headModel = DetailModel()
                self.headModel!.setValuesForKeysWithDictionary(response.result.value as! [String:AnyObject])
                self.fillHead()
            }
        }
        
        Alamofire.request(.GET, urlNearBy).responseJSON { [unowned self](response) in
            if response.result.error == nil {
                let apps = response.result.value! ["applications"] as! [[String:AnyObject]]
                for app in apps {
                    let model = NearByModel()
                    model.setValuesForKeysWithDictionary(app)
                    self.footArray.append(model)
                }
                self.fillFoot()
            }
        }
    }
    
    func fillHead() {
        appImageView?.kf_setImageWithURL(NSURL(string: headModel!.iconUrl))
        appName?.text = headModel!.name
        appSome1?.text = "原价:¥\(headModel!.lastPrice) \(headModel!.priceTrend) \(headModel!.fileSize)MB"
        appSome2?.text = "类型:\(headModel!.categoryName) 评分:\(headModel!.starCurrent)"
        
        for i in 0..<headModel!.photos.count {
            let imageView = UIImageView(frame: CGRect(x: 5+55*i, y: 0, width: 50, height: 75))
            imageView.kf_setImageWithURL(NSURL(string: headModel!.photos[i]["smallUrl"]!))
            appScrollView?.addSubview(imageView)
        }
        appScrollView!.contentSize = CGSizeMake(CGFloat(headModel!.photos.count)*60-10, 75)
        appDetail?.text = headModel?.description_long
    }
    
    func fillFoot() {
        for i in 0..<footArray.count {
            let model = footArray[i]
            let tapView = JLTapView(frame: CGRect(x: 55*i, y: 0, width: 45, height: 65), iconUrlString: model.iconUrl!, name: model.name!, closure: { [unowned self](tapView) in
                let model = self.footArray[tapView.tag-200]
                let vc = DetailViewController()
                vc.appId = model.applicationId
                self.navigationController?.pushViewController(vc
                    , animated: true)
                })
            tapView.tag = 200+i
            footScrollView.addSubview(tapView)
        }
        footScrollView.contentSize = CGSize(width: footArray.count*55-10, height: 65)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
