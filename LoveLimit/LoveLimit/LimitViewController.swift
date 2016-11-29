//
//  LimitViewController.swift
//  LoveLimit
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class LimitViewController: UITableViewController,JSNavigationProtocol,JLTableViewProtocol,JLSearchBarDelegate {
    var dataArray:[LimitModel] = []
    var currentPage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configUI()
        
    }
    
    func loadData() {
        let aurlLimitList = String(format: urlLimitList, currentPage)
        Alamofire.request(.GET, aurlLimitList).responseJSON { [unowned self](response) in
            self.tableView.mj_header.endRefreshing()
            self.tableView.mj_footer.endRefreshing()
            if self.currentPage == 1 {
                self.dataArray.removeAll()
            }
            if response.result.error == nil {
                let dic = response.result.value as! [String:AnyObject]
                let appArray = dic["applications"] as![[String:AnyObject]]
                
                for dic in appArray {
                    let model = LimitModel()
                    model.setValuesForKeysWithDictionary(dic)
                    self.dataArray.append(model)
                }
                self.tableView.reloadData()
            }
        }
    }
    
    func configUI() {
        tableView.registerNib(UINib(nibName: "LimitViewCell",bundle: nil), forCellReuseIdentifier: "cell")
        addTitle(title!)
        addButton("分类", position: .left, select: #selector(leftClick))
        addButton("设置", position: .right, select: #selector(rightClick))
        addSearchBar("60万款应用搜索看", delegate: self)
        addRefresh({ [unowned self] in
            self.currentPage = 1
            self.loadData()
            }) { [unowned self] in
                self.currentPage += 1
                self.loadData()
        }
    }
    
    func leftClick() {
        
    }
    
    func rightClick() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! LimitViewCell
        let model = dataArray[indexPath.row]
        cell.CategoryNameLabel.text = model.categoryName
        cell.CurrentPriceLabel.text = "现价:¥ \(model.currentPrice).00"
        cell.DownloadsLabel.text = "下载:\(model.downloads)"
        cell.FavoritesLabel.text = "收藏:\(model.favorites)"
        cell.LastPriceLabel.text = "¥ \(model.lastPrice).0"
        cell.NameLabel.text = model.name
        cell.SharesLabel.text = "分享:\(model.shares)"
        cell.AppIconImage.kf_setImageWithURL(NSURL(string: model.iconUrl!))
        cell.starview.setStar(CGFloat((model.starCurrent as NSString).floatValue))
        if indexPath.row%2 == 0 {
            cell.AppBGImage.image = UIImage(named: "cate_list_bg1.png")
        }else{
            cell.AppBGImage.image = UIImage(named: "cate_list_bg2.png")
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = DetailViewController2()
        let model = dataArray[indexPath.row]
        vc.appId = model.applicationId
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK:JLSearchBar的代理方法
extension LimitViewController {
    func sendSearchText(text: String) {
        print(text)
    }
}











