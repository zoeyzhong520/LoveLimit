//
//  DetailViewController2.swift
//  LoveLimit
//
//  Created by qianfeng on 16/10/10.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire

class DetailViewController2: UIViewController,JSNavigationProtocol {
    var appId:String?
    var headerModel:[DetailModel] = []
    var footArray:[NearByModel] = []
    var headBgImageView:UIImageView!
    var footBgImageView:UIImageView!
    var appImageView:UIImageView!
    var appName:UILabel?
    var appSome1:UILabel?
    var appSome2:UILabel?
    var appScrollView:UIScrollView!
    var appDetail:UILabel?
    var appFootScrollView:UIScrollView!
    var headModel = DetailModel()
    let itunsUrl = "http://phobos.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=291586600&amp;mt=8"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        configUI()
        loadData()
        configHead()
        configFoot()
    }
    
    func configUI() {
        addTitle("应用详情")
        addButton("返回", position: .left, select: #selector(leftBtnClick(_:)))
    }
    
    func configHead() {
        headBgImageView = UIImageView()
        headBgImageView.image = UIImage(named: "appdetail_background.png")
        view.addSubview(headBgImageView)
        headBgImageView.snp_makeConstraints { (make) in
//            make.size.equalTo(CGSize(width: 300, height: 320))
            make.top.equalTo(view.snp_top).offset(navBarHeight+10)
            make.left.equalTo(view.snp_left).offset(10)
            make.right.equalTo(view.snp_right).offset(-10)
        }
        
        appImageView = UIImageView()
        headBgImageView.addSubview(appImageView)
        appImageView.snp_makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 60, height: 60))
            make.top.equalTo(headBgImageView.snp_top).offset(15)
            make.left.equalTo(headBgImageView.snp_left).offset(10)
        }
        
        appName = UILabel()
        headBgImageView.addSubview(appName!)
        appName?.snp_makeConstraints(closure: { (make) in
            make.size.equalTo(CGSize(width: 200, height: 20))
            make.top.equalTo(headBgImageView.snp_top).offset(10)
            make.left.equalTo(headBgImageView.snp_left).offset(80)
        })
        
        appSome1 = UILabel()
        appSome1?.font = UIFont.systemFontOfSize(fontLevelFive)
        appSome1?.textColor = UIColor.grayColor()
        headBgImageView.addSubview(appSome1!)
        appSome1?.snp_makeConstraints(closure: { (make) in
            make.size.equalTo(CGSize(width: 200, height: 20))
            make.top.equalTo(headBgImageView.snp_top).offset(35)
            make.left.equalTo(headBgImageView.snp_left).offset(80)
        })
        
        appSome2 = UILabel()
        appSome2?.font = UIFont.systemFontOfSize(fontLevelFive)
        appSome2?.textColor = UIColor.grayColor()
        headBgImageView.addSubview(appSome2!)
        appSome2?.snp_makeConstraints(closure: { (make) in
//            make.size.equalTo(CGSize(width: 200, height: 20))
            make.top.equalTo(headBgImageView.snp_top).offset(60)
            make.left.equalTo(headBgImageView.snp_left).offset(80)
            
        })
        
        let btnNames = ["分享","收藏","下载"]
        for i in 0..<btnNames.count {
            let btn = UIButton()
            btn.setTitle(btnNames[i], forState: .Normal)
            btn.setTitleColor(UIColor.init(red: 96/255, green: 119/255, blue: 154/255, alpha: 1.0), forState: .Normal)
            btn.setBackgroundImage(UIImage(named: "Detail_btn_left.png"), forState: .Normal)
            btn.addTarget(self, action: #selector(btnClick(_:)), forControlEvents: .TouchUpInside)
            btn.tag = 100+i
            view.addSubview(btn)
            btn.snp_makeConstraints(closure: { (make) in
                make.size.equalTo(CGSize(width: 100, height: 30))
                make.top.equalTo(view.snp_top).offset(160)
                make.left.equalTo(headBgImageView.snp_left).offset(CGFloat(i)*(screenWidth-20)/3)
            })
        }
        
        appScrollView = UIScrollView()
        appScrollView?.showsVerticalScrollIndicator = false
        headBgImageView.addSubview(appScrollView!)
        appScrollView?.snp_makeConstraints(closure: { (make) in
            make.size.equalTo(CGSize(width: 280, height: 75))
            make.top.equalTo(headBgImageView.snp_top).offset(130)
            make.left.equalTo(headBgImageView.snp_left).offset(10)
        })
        
        appDetail = UILabel()
        appDetail?.numberOfLines = 0
        appDetail?.textColor = UIColor.grayColor()
        appDetail?.font = UIFont.systemFontOfSize(13)
        appDetail?.lineBreakMode = .ByCharWrapping
        headBgImageView.addSubview(appDetail!)
        appDetail?.snp_makeConstraints(closure: { (make) in
//            make.size.equalTo(CGSize(width: 280, height: 100))
            make.top.equalTo(headBgImageView.snp_top).offset(210)
            make.left.equalTo(headBgImageView.snp_left).offset(10)
            make.right.equalTo(headBgImageView.snp_right).offset(-10)
            make.bottom.equalTo(headBgImageView.snp_bottom).offset(-10)
            make.height.equalTo(100)
        })
    }
    
    func btnClick(btn:UIButton) {
        if btn.tag == 100 {
            
        }else if btn.tag == 101 {
            
        }else if btn.tag == 102 {
            UIApplication.sharedApplication().openURL(NSURL(string:headModel.itunesUrl)!)
        }
    }
    
    func configFoot() {
        footBgImageView = UIImageView()
        footBgImageView.image = UIImage(named: "appdetail_recommend.png")
        view.addSubview(footBgImageView)
        footBgImageView.snp_makeConstraints { (make) in
            make.right.equalTo(view.snp_right).offset(-10)
//            make.size.equalTo(CGSize(width: 300, height: 105))
            make.left.equalTo(view.snp_left).offset(10)
            make.top.equalTo(headBgImageView.snp_bottom).offset(10)
        }
        
        appFootScrollView = UIScrollView()
        appFootScrollView.showsVerticalScrollIndicator = false
        footBgImageView.userInteractionEnabled = true
        footBgImageView.addSubview(appFootScrollView)
        appFootScrollView.snp_makeConstraints { (make) in
//            make.size.equalTo(CGSize(width: 300, height: 65))
            make.left.equalTo(footBgImageView.snp_left).offset(10)
            make.top.equalTo(footBgImageView.snp_top).offset(30)
            make.bottom.equalTo(footBgImageView.snp_bottom).offset(-10)
            make.right.equalTo(footBgImageView.snp_right).offset(-10)
        }
    }
    
    func loadData() {
        let urlString = String(format: urlDetail, appId!)
        Alamofire.request(.GET, urlString).responseJSON { [unowned self](response) in
            if response.result.error == nil {
//                print(response.result.value)
                self.headModel = DetailModel()
                self.headModel.setValuesForKeysWithDictionary(response.result.value as! [String:AnyObject])
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
        appImageView.kf_setImageWithURL(NSURL(string: (headModel.iconUrl)!))
        appName?.text = headModel.name
        appSome1?.text = "原价:¥\(headModel.lastPrice) \(headModel.priceTrend) \(headModel.fileSize)MB"
        appSome2?.text = "类型:\(headModel.categoryName) 评分:\(headModel.starCurrent)"
        
        for i in 0..<headModel.photos.count {
            let imageView = UIImageView()
            imageView.kf_setImageWithURL(NSURL(string: headModel.photos[i]["smallUrl"]!))
            appScrollView.addSubview(imageView)
            imageView.snp_makeConstraints(closure: { (make) in
                make.size.equalTo(CGSize(width: 50, height: 75))
                make.top.equalTo(appScrollView.snp_top).offset(0)
                make.left.equalTo(appScrollView.snp_left).offset(5+55*i)
            })
        }
        
        appScrollView.contentSize = CGSizeMake(CGFloat(headModel.photos.count)*60-10, 75)
        appDetail?.text = headModel.description_long
    }
    
    func fillFoot() {
        for i in 0..<footArray.count {
            let model = footArray[i]
            let tapView = JLTapView(frame: CGRect(x: 55*i, y: 0, width: 45, height: 65), iconUrlString: model.iconUrl!, name: model.name!, closure: { [unowned self] (tapView) in
                let model = self.footArray[tapView.tag-200]
                let vc = DetailViewController2()
                vc.appId = model.applicationId
                self.navigationController?.pushViewController(vc
                    , animated: true)
            })
            tapView.tag = 200+i
            appFootScrollView.addSubview(tapView)
        }
        appFootScrollView.contentSize = CGSize(width: footArray.count*55-10, height: 65)
    }
    
    func leftBtnClick(btn:UIBarButtonItem) {
        navigationController?.popViewControllerAnimated(true)
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
