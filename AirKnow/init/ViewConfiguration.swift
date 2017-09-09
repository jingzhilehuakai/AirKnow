//
//  ViewConfiguration.swift
//  AirKnow
//
//  Created by 陈超邦 on 2017/9/7.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit
import SnapKit
import SwifterSwift
import SwiftTheme

class ViewConfiguration: NSObject {
    
    // MARK: View Configuration
    class func setup(window: inout UIWindow?) {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.rootViewController = HomePageTabbrControllerViewController()
        window?.makeKeyAndVisible()
        
        setupStatus()
    }
    
    class func setupStatus() {
        UIApplication.shared.theme_setStatusBarStyle(AirKnowConfig.airKnowGlobalStatusBarStringStyles, animated: true)
    }
}
