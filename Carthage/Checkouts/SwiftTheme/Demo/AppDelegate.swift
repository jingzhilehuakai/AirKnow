//
//  AppDelegate.swift
//  Demo
//
//  Created by Gesen on 16/1/23.
//  Copyright © 2016年 Gesen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application:UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        
        MyThemes.restoreLastTheme()
        
        // status bar
        
        UIApplication.shared.theme_setStatusBarStyle([.lightContent, .default, .lightContent, .lightContent], animated: true)
        
        // navigation bar

        let navigationBar = UINavigationBar.appearance()
        let shadow = NSShadow()
            shadow.shadowOffset = CGSize(width: 0, height: 0)
        let titleAttributes: [[String: AnyObject]] = globalBarTextColors.map { hexString in
            return [
                NSForegroundColorAttributeName: UIColor(rgba: hexString),
                NSFontAttributeName: UIFont.systemFont(ofSize: 16),
                NSShadowAttributeName: shadow
            ]
        }
        
        navigationBar.theme_tintColor = globalBarTextColorPicker
        navigationBar.theme_barTintColor = globalBarTintColorPicker
        navigationBar.theme_titleTextAttributes = ThemeDictionaryPicker.pickerWithDicts(titleAttributes)
        
        // tab bar
        
        let tabBar = UITabBar.appearance()
        tabBar.theme_tintColor = globalBarTextColorPicker
        tabBar.theme_barTintColor = globalBarTintColorPicker
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) { }

    func applicationDidEnterBackground(_ application: UIApplication) { }

    func applicationWillEnterForeground(_ application: UIApplication) { }

    func applicationDidBecomeActive(_ application: UIApplication) { }

    func applicationWillTerminate(_ application: UIApplication) {
        MyThemes.saveLastTheme()
    }


}

