//
//  AppDelegate.swift
//  LoveLimit
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let vc = GuideViewController()
        vc.closure = {self.creatRoot()}
        self.window?.rootViewController = vc
        return true
    }
    
    func creatRoot() {
        let tabBarController = UITabBarController()
        let namesVC = ["LoveLimit.LimitViewController","LoveLimit.ReducePriceViewController","LoveLimit.AppFreeViewController","LoveLimit.SubjectViewController","LoveLimit.HotViewController"]
        let titles = ["限免","降价","免费","专题","热榜"]
        let images = ["tabbar_limitfree","tabbar_reduceprice","tabbar_appfree","tabbar_subject","tabbar_rank"]
        var viewControllers:[UIViewController] = []
        for i in 0..<namesVC.count {
            /*NSClassFromString(String)
             在运行时，根据String找到类，将类放到class中
             as! UIViewController.Type 将找到的类转化成UIViewController类型（必须本身就是此类型）
             */
            let vcClasss = NSClassFromString(namesVC[i]) as! UIViewController.Type
            //用class创建对象
            let vc = vcClasss.init()
            vc.title = titles[i]
            let nav = UINavigationController(rootViewController: vc)
            nav.tabBarItem.image = UIImage(named: images[i])
            nav.tabBarItem.selectedImage = UIImage(named: "\(images[i])_press")?.imageWithRenderingMode(.AlwaysOriginal)
            viewControllers.append(nav)
        }
        tabBarController.viewControllers = viewControllers
        window?.rootViewController = tabBarController
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

