//
//  AppDelegate.swift
//  SurfingNavigationBarDemo
//
//  Created by chenpeiwei on 6/15/16.
//  Copyright © 2016 chenpeiwei. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        
        let tabBarController = UITabBarController()
        
        let navController1 = UINavigationController(rootViewController: DemoViewController())
        let navController2 = UINavigationController(rootViewController: DemoViewController2())
        let navController3 = UINavigationController(rootViewController: DemoViewController3())
        let navController4 = UINavigationController(rootViewController: DemoViewController4())

        navController1.title = "BGColorVC"
        navController2.title = "AlphaVC"
        navController3.title = "TranslationYVC"
        navController4.title = "AllFunctions"

        navController1.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -20)
        navController2.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -20)
        navController3.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -20)
        navController4.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -20)

        tabBarController.viewControllers = [navController1,navController2,navController3,navController4]
        
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
        
        customizeTabbarItem()

        return true
    }
    
    
    func customizeTabbarItem() {
        let colorNormal : UIColor = UIColor.blackColor()
        let colorSelected : UIColor = UIColor.purpleColor()
        let titleFontAll : UIFont = UIFont(name: "American Typewriter", size: 13.0)!
        
        let attributesNormal = [
            NSForegroundColorAttributeName : colorNormal,
            NSFontAttributeName : titleFontAll
        ]
        
        let attributesSelected = [
            NSForegroundColorAttributeName : colorSelected,
            NSFontAttributeName : titleFontAll
        ]
        
        UITabBarItem.appearance().setTitleTextAttributes(attributesNormal, forState: .Normal)
        UITabBarItem.appearance().setTitleTextAttributes(attributesSelected, forState: .Selected)
    }
}
