//
//  ExampleProvider.swift
//  ESTabBarControllerExample
//
//  Created by lihao on 2017/2/9.
//  Copyright © 2017年 Vincent Li. All rights reserved.
//

import UIKit

enum TabBarProvider
{
    static func getTabBar() -> UITabBarController
    {
        let tabBarController = UITabBarController()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let v1: DashBoardWarrantyViewController = storyboard.instantiateViewController(withIdentifier: "DashBoardWarrantyViewController") as! DashBoardWarrantyViewController
        let v0: OpenWebSiteViewController = storyboard.instantiateViewController(withIdentifier: "OpenWebSiteViewController") as! OpenWebSiteViewController
        let v2: ShareWarrantyViewController = storyboard.instantiateViewController(withIdentifier: "ShareWarrantyViewController") as! ShareWarrantyViewController
        let v3: AddWarrantyViewController = storyboard.instantiateViewController(withIdentifier: "AddWarrantyViewController") as! AddWarrantyViewController
        let v4: ShowAllWarrantyListViewController = storyboard.instantiateViewController(withIdentifier: "ShowAllWarrantyListViewController") as! ShowAllWarrantyListViewController
        let v5: SyncDataViewController = storyboard.instantiateViewController(withIdentifier: "SyncDataViewController") as! SyncDataViewController
        
        v1.tabBarItem = UITabBarItem.init(title: "", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
        v2.tabBarItem = UITabBarItem.init(title: "", image: UIImage(named: "share"), selectedImage: UIImage(named: "share"))
        v3.tabBarItem = UITabBarItem.init(title: "", image: UIImage(named: "new"), selectedImage: UIImage(named: "new"))
        v4.tabBarItem = UITabBarItem.init(title: "", image: UIImage(named: "list"), selectedImage: UIImage(named: "list"))
        v5.tabBarItem = UITabBarItem.init(title: "", image: UIImage(named: "sync"), selectedImage: UIImage(named: "sync"))
        v1.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        v2.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        v3.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        v4.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        v5.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)

        UITabBar.appearance().tintColor = API.btnLightBlueColor()

        let n0 = UINavigationController.init(rootViewController: v0)
        let n1 = UINavigationController.init(rootViewController: v1)
        let n2 = UINavigationController.init(rootViewController: v2)
        let n3 = UINavigationController.init(rootViewController: v3)
        let n4 = UINavigationController.init(rootViewController: v4)
        let n5 = UINavigationController.init(rootViewController: v5)
        
        tabBarController.viewControllers = [n1, n2, n3, n4, n5]
        tabBarController.tabBar.barTintColor = UIColor.white
        //tabBarController.tabBar.tintColor = API.btnLightBlueColor()
        

         //tabBarController.UI = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        
        return tabBarController
    }
    
}

