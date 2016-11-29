//
//  GuideViewController.swift
//  LoveLimit
//
//  Created by qianfeng on 16/10/9.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class GuideViewController: UIViewController,UIScrollViewDelegate {
    var numOfPages = 3
    var pageControl:UIPageControl!
    var closure:(()->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = self.view.bounds
        let scrollView = UIScrollView()
        scrollView.frame = self.view.bounds
        scrollView.delegate = self
        scrollView.contentSize = CGSizeMake(frame.size.width*CGFloat(numOfPages), frame.size.height)
        scrollView.pagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.scrollsToTop = false
        for i in 0..<numOfPages {
            let imgNames = ["10_13.jpg","10_14.jpg","10_15.jpg"]
            let imageView = UIImageView()
            imageView.frame = CGRectMake(frame.width*CGFloat(i), 0, frame.width, frame.height)
            imageView.image = UIImage(named: imgNames[i])
            scrollView.addSubview(imageView)
        }
        scrollView.contentOffset = CGPointZero
        self.view.addSubview(scrollView)
        
        pageControl = UIPageControl(frame: CGRect(x: 0, y: screeenHeight-60, width: screenWidth, height: 60))
        pageControl.numberOfPages = scrollView.subviews.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.redColor()
        pageControl.currentPageIndicatorTintColor = UIColor.yellowColor()
        pageControl.backgroundColor = UIColor.blackColor()
        pageControl.alpha = 0.6
        view.addSubview(pageControl)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x/view.frame.size.width)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let twidth = CGFloat(numOfPages-1)*self.view.bounds.width
        if scrollView.contentOffset.x > twidth {
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            self.presentViewController(mainStoryboard.instantiateInitialViewController()!, animated: true, completion: closure)
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
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
