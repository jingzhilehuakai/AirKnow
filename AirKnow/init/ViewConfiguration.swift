//
//  ViewConfiguration.swift
//  AirKnow
//
//  Created by 陈超邦 on 2017/9/7.
//  Copyright © 2017年 陈超邦. All rights reserved.
//

import UIKit
import SwifterSwift
import XLPagerTabStrip

class ViewConfiguration: NSObject {
    
    // View Configuration
    class func setup(window: inout UIWindow?) {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.rootViewController = self.tabbarConfiguration()
        window?.makeKeyAndVisible()
    }
    
    // Tabbar ViewController Configuration
    class func tabbarConfiguration() -> UITabBarController {
        let tabbarController = UITabBarController.init()
        let tabFrame: CGRect = CGRect.init(x: tabbarController.tabBar.x, y: tabbarController.view.height - AirKnowConfig.airKnowTabbarHeight, width: tabbarController.tabBar.width, height: AirKnowConfig.airKnowTabbarHeight)
        tabbarController.tabBar.frame = tabFrame
        tabbarController.tabBar.backgroundImage = UIImage.init(color: UIColor.airKnowTabbarColor(), size: tabbarController.tabBar.frame.size)
        return tabbarController
    }
}
