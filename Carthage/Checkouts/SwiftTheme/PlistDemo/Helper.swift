//
//  Helper.swift
//  PlistDemo
//
//  Created by Gesen on 16/3/15.
//  Copyright © 2016年 Gesen. All rights reserved.
//

import Foundation


let cachesURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
let libraryURL = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask)[0]


extension MBProgressHUD {

    class func showHUD(_ text: String) -> MBProgressHUD {
        let view = UIApplication.shared.windows.last
        
        let HUD = MBProgressHUD.showAdded(to: view, animated: true)
        HUD?.labelText = text
        HUD?.removeFromSuperViewOnHide = true
        HUD?.dimBackground = false
        return HUD!
    }
    
}
