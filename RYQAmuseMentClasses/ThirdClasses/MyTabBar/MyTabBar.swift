//
//  MyTabBar.swift
//  StarAPP
//
//  Created by 刘园 on 2018/4/2.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import UIKit

class MyTabBar: UITabBarController ,UITabBarControllerDelegate {
    
     func MyTabBar() -> UITabBarController {
        let tabBarVC = UITabBarController()
        tabBarVC.delegate = self
        //首页
        let homeNavi = self.initNavigationController(myClass: YZSHomeVC.self, title: "首页", imgName: "tabbar_icon_home", selectedImgName: "tabbar_icon_home_selected")
        //话题
        let topicNavi = self.initNavigationController(myClass: YZSHTopicVC.self, title: "话题", imgName: "tabbar_icon_friend", selectedImgName: "tabbar_icon_friend_selected")
        //弹出框
        let pushNavi = self.initNavigationController(myClass: YZSHPublishVC.self, title: "", imgName: "tabbar_icon_publish", selectedImgName: "tabbar_icon_publish")
        //生活
        let lifeNaviVC = self.initNavigationController(myClass: YZSHLifeVC.self, title: "开锁测试", imgName: "tabbar_icon_all", selectedImgName: "tabbar_icon_all_selected")
        //个人中心
        let centerNaviVC = self.initNavigationController(myClass: YZSHUserCenterVC.self, title: "个人中心", imgName: "tabbar_icon_me", selectedImgName: "tabbar_icon_me_selected")
        
        tabBarVC.tabBar.tintColor = ButtonBackColor
        tabBarVC.viewControllers = [homeNavi, topicNavi, pushNavi, lifeNaviVC, centerNaviVC]
        
        return tabBarVC;
    }
    
    func initNavigationController(myClass:AnyClass, title:String, imgName:String, selectedImgName:String) -> MyNavigation {
        
        let vcClass = myClass as? UIViewController.Type
        let vc = vcClass!.init()
        let navi = MyNavigation.init(rootViewController: vc)
        let barItem = UITabBarItem.init(title: title, image: MyPublic.getImgView(imgName as NSString), selectedImage: MyPublic.getImgView(selectedImgName as NSString))
        barItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
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
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        RYQLog(tabBar);
        
        if item.title == "" {
            
        }
    }
}
