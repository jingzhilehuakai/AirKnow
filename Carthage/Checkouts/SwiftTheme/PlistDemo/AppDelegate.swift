//
//  AppDelegate.swift
//  PlistDemo
//
//  Created by Gesen on 16/3/1.
//  Copyright © 2016年 Gesen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // default: Red.plist
        
        ThemeManager.setTheme(plistName: "Red", path: .mainBundle)
        
        // status bar
        
        UIApplication.shared.theme_setStatusBarStyle("UIStatusBarStyle", animated: true)
        
        // navigation bar
        
        let navigationBar = UINavigationBar.appearance()
        
        navigationBar.theme_tintColor = "Global.barTextColor"
        navigationBar.theme_barTintColor = "Global.barTintColor"
        
        navigationBar.theme_titleTextAttributes = ThemeDictionaryPicker(keyPath: "Global.barTextColor", map: { value in
            guard
                let rgba = value as? String,
                let color = try? UIColor(rgba_throws: rgba) else {
                    return nil
            }
            
            let shadow = NSShadow(); shadow.shadowOffset = CGSize.zero
            let titleTextAttributes = [
                NSForegroundColorAttributeName: color,
                NSFontAttributeName: UIFont.systemFont(ofSize: 16),
                NSShadowAttributeName: shadow
            ]
            
            return titleTextAttributes
        })
        
        // tab bar
        
        let tabBar = UITabBar.appearance()

        tabBar.theme_tintColor = "Global.barTextColor"
        tabBar.theme_barTintColor = "Global.barTintColor"
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) { }
    
    func applicationDidEnterBackground(_ application: UIApplication) { }
    
    func applicationWillEnterForeground(_ application: UIApplication) { }
    
    func applicationDidBecomeActive(_ application: UIApplication) { }
    
    func applicationWillTerminate(_ application: UIApplication) { }
    

}

