//
//  AppFreeViewController.swift
//  LoveLimit
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class AppFreeViewController: UITableViewController,JSNavigationProtocol,JLSearchBarDelegate,JLTableViewProtocol {
    var dataArray:[appFreeModel] = []
    var currentPage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        loadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func configUI() {
        tableView.registerNib(UINib(nibName: "AppFreeCell",bundle: nil), forCellReuseIdentifier: "cell")
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
    
    func loadData() {
        Alamofire.request(.GET, String(format: urlAppFree, currentPage)).responseJSON { [unowned self] (response) in
            if response.result.error == nil {
                self.tableView.mj_header.endRefreshing()
                self.tableView.mj_footer.endRefreshing()
                if self.currentPage == 1 {
                    self.dataArray.removeAll()
                }
                let Dic = response.result.value as! [String:AnyObject]
                let appArray = Dic["applications"] as! [AnyObject]
                for dic in appArray {
                    let model = appFreeModel()
                    model.setValuesForKeysWithDictionary(dic as! [String : AnyObject])
                    self.dataArray.append(model)
                }
                self.tableView.reloadData()
                //print(self.dataArray[0].categoryName)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArray.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! AppFreeCell
        let model = dataArray[indexPath.row]
        cell.categoryNameLabel.text = model.categoryName
        cell.currentPriceLabel.text = "¥ \(model.currentPrice).0"
        cell.downloadsLabel.text = "下载:\(model.downloads)"
        cell.favoritesLabel.text = "收藏:\(model.favorites)"
        cell.nameLabel.text = model.name
        cell.sharesLabel.text = "分享:\(model.shares)"
        cell.starCurrentLabel.text = "评分:\(model.starCurrent)分"
        cell.appIconImage.kf_setImageWithURL(NSURL(string: model.iconUrl))
        cell.starview.setStar(CGFloat((model.starCurrent as NSString).floatValue))
        if indexPath.row%2 == 0 {
            cell.appBGImage.image = UIImage(named: "cate_list_bg1.png")
        }else{
            cell.appBGImage.image = UIImage(named: "cate_list_bg2.png")
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = DetailViewController()
        let model = dataArray[indexPath.row]
        vc.appId = model.applicationId
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension AppFreeViewController {
    func sendSearchText(text: String) {
        print(text)
    }
}












