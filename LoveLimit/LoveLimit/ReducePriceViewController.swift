//
//  ReducePriceViewController.swift
//  LoveLimit
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class ReducePriceViewController: UITableViewController,JSNavigationProtocol,JLSearchBarDelegate,JLTableViewProtocol {
    var dataArray:[ReducePriceModel] = []
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
        tableView.registerNib(UINib(nibName: "ReducePriceCell",bundle: nil), forCellReuseIdentifier: "cell")
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
        Alamofire.request(.GET, String(format: urlReducePrice, currentPage)).responseJSON { [unowned self] (response) in
            if response.result.error == nil {
                self.tableView.mj_header.endRefreshing()
                self.tableView.mj_footer.endRefreshing()
                if self.currentPage == 1 {
                    self.dataArray.removeAll()
                }
                let dic = response.result.value as! [String:AnyObject]
                let appArray = dic["applications"] as! [AnyObject]
                for dic in appArray {
                    let model = ReducePriceModel()
                    model.setValuesForKeysWithDictionary(dic as! [String : AnyObject])
                    self.dataArray.append(model)
                }
                self.tableView.reloadData()
            }
        }
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
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ReducePriceCell
        let model = dataArray[indexPath.row]
        cell.nameLabel.text = model.name
        cell.currentPriceLabel.text = "现价:¥ \(model.currentPrice).00"
        cell.sharesLabel.text = "分享:\(model.shares)"
        cell.favoritesLabel.text = "收藏:\(model.favorites)"
        cell.downloadsLabel.text = "下载:\(model.downloads)"
        cell.lastPriceLabel.text = "¥ \(model.lastPrice).0"
        cell.categoryNameLabel.text = model.categoryName
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

extension ReducePriceViewController {
    func sendSearchText(text: String) {
        print(text)
    }
}











