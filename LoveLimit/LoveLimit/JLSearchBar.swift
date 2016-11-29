//
//  JLSearchBar.swift
//  LoveLimit
//
//  Created by qianfeng on 16/9/27.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

protocol JLSearchBarDelegate:NSObjectProtocol {
    func sendSearchText(text:String)
}

class JLSearchBar: UIView,UISearchBarDelegate {
    private var searchBar:UISearchBar?
    private var bgView:UIView?
    private let height:CGFloat = 40
    private var placeHolder:String?
    private weak var delegate:JLSearchBarDelegate?
    
    init(frame: CGRect,placeHolder:String?,delegate:JLSearchBarDelegate?=nil) {
        super.init(frame: CGRect(origin: frame.origin, size: CGSizeMake(frame.size.width, height)))
        self.placeHolder = placeHolder
        self.delegate = delegate
        configView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configView()
    }

    func configView() {
        searchBar = UISearchBar(frame: self.bounds)
        searchBar?.placeholder = placeHolder
        searchBar?.barStyle = .Default
        searchBar?.delegate = self
        addSubview(searchBar!)
    }
    
    func showBgViewIn(view:UIView,frame:CGRect) {
        if bgView == nil {
            bgView = UIView(frame: frame)
            bgView?.backgroundColor = UIColor.colorWith(R: 255, G: 255, B: 255, A: 0.8)
        }
        bgView?.hidden = true
        view.addSubview(bgView!)
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}

extension JLSearchBar {
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        //让cancel按钮显示
        searchBar.setShowsCancelButton(true, animated: true)
        bgView?.hidden = false
        return true
    }
    
    func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool {
        searchBar.text = ""
        searchBar.setShowsCancelButton(false, animated: true)
        bgView?.hidden = true
        return true
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        if delegate != nil&&searchBar.text != nil {
            delegate?.sendSearchText(searchBar.text!)
        }
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}



