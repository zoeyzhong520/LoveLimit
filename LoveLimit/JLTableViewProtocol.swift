//
//  JLTableViewProtocol.swift
//  LoveLimit
//
//  Created by qianfeng on 16/9/27.
//  Copyright © 2016年 zzj. All rights reserved.
//

import Foundation
import UIKit
import MJRefresh

protocol JLAddRefreshProtocol:NSObjectProtocol {
    func addRefresh(header:(()->())?,footer:(()->())?)
}

protocol JLTableViewProtocol:NSObjectProtocol,JLAddRefreshProtocol {
    func addSearchBar(placeHolder:String?,delegate:JLSearchBarDelegate?)
}

extension JLTableViewProtocol where Self:UITableViewController {
    func addSearchBar(placeHolder:String?,delegate:JLSearchBarDelegate?) {
        let searchBar = JLSearchBar(frame: CGRect(x: 0, y: navBarHeight, width: screenWidth, height: 40), placeHolder: placeHolder, delegate: delegate)
        view.addSubview(searchBar)
        tableView.tableHeaderView = searchBar
        searchBar.showBgViewIn(tableView, frame: CGRect(x: 0, y: 40, width: screenWidth, height: screeenHeight-navBarHeight-40))
    }
    
    func addRefresh(header:(()->())?=nil,footer:(()->())?=nil) {
        if header != nil {
            tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: header)
        }
        
        if footer != nil {
            tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: footer)
        }
    }
}





