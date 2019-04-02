//
//  MyTabBar.swift
//  StarAPP
//
//  Created by 刘园 on 2018/4/2.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import UIKit

class MyTabBar: UITabBarController {
    
     func MyTabBar() -> UITabBarController {
        let tabBarVC = UITabBarController()
        
        //床位管理导航控制器
        let bedNavi = self.initNavigationController(myClass: ViewController.self, title: "床位管理", imgName: "bedManngerUnSelected", selectedImgName: "bedManngerSelected")
        //收益管理导航控制器
        let gainsNavi = self.initNavigationController(myClass: ViewController.self, title: "收益管理", imgName: "incomeManngerUnSelected", selectedImgName: "incomeManngerSelected")
        //报修中心导航控制器
        let repairsNavi = self.initNavigationController(myClass: ViewController.self, title: "报修中心", imgName: "repairsCenterUnSelcted", selectedImgName: "repairsCenterSelcted")
        //开锁测试导航控制器
        let openNaviVC = self.initNavigationController(myClass: ViewController.self, title: "开锁测试", imgName: "OpenLockUnSelected", selectedImgName: "OpenLockSelected")
        
        tabBarVC.tabBar.tintColor = ButtonBackColor
        tabBarVC.viewControllers = [bedNavi, gainsNavi, repairsNavi, openNaviVC]
        
        return tabBarVC;
    }
    
    func initNavigationController(myClass:AnyClass, title:String, imgName:String, selectedImgName:String) -> MyNavigation {
        
        let vcClass = myClass as? UIViewController.Type
        let vc = vcClass!.init()
        let navi = MyNavigation.init(rootViewController: vc)
        let barItem = UITabBarItem.init(title: title, image: MyPublic.getImgView(imgName as NSString), selectedImage: MyPublic.getImgView(selectedImgName as NSString))
        navi.tabBarItem = barItem
        
        return navi
    }
    
    // 创建子控制器
    func addOneChildViewController(_ childVC:UIViewController, title:String, imageName:String, selectedImageName:String) {
        childVC.title = title;
        childVC.tabBarItem.image = UIImage(named: imageName)
        childVC.tabBarItem.selectedImage = UIImage(named: selectedImageName)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        let nav = MyNavigation(rootViewController:childVC)
        self.addChild(nav)
    }
}
