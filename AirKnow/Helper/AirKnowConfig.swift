//
//  AirKnowConfig.swift
//  AirKnow
//
//  Created by 陈超邦 on 2017/9/7.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit
import Foundation
import SwiftTheme

final class AirKnowConfig {
    
    static let airKnowTabbarHeight: CGFloat = 35.0

    static let airKnowPromptButtonLeftPadding: CGFloat = 10
    static let airKnowPromptButtonTopPadding: CGFloat = 10
    static let airKnowPromptButtonHeight: CGFloat = airKnowTabbarHeight - 2 * airKnowPromptButtonTopPadding
    
    static let airKnowAddLocationButtonRightPadding: CGFloat = -10
    static let airKnowAddLocationButtonTopPadding: CGFloat = 10
    static let airKnowAddLocationButtonHeight: CGFloat = airKnowTabbarHeight - 2 * airKnowAddLocationButtonTopPadding
    
    struct airKnowTheme {
        let light = 0; let dark  = 1
    }
    static let airKnowGlobalStatusBarStringStyles: ThemeStatusBarStylePicker = [UIStatusBarStyle.default, UIStatusBarStyle.lightContent]
    static let airKnowGlobalHomePageVCBGStringStyels: ThemeColorPicker = ["#FFF", "#0B0B0B"]
    static let airKnowGlobalTabbarStringStyles: ThemeColorPicker = ["#56AF1F", "#1E1E1E"]
    static let airKnowGlobalTabbarPromptButtonImageStringStyels: ThemeImagePicker = ["tabbarPrompt_Light", "tabbarPrompt_Light"]
    static let airKnowGlobalTabbarAddLocationButtonImageStringStyels: ThemeImagePicker = ["tabbarAdd_Light", "tabbarAdd_Light"]
    static let airKnowGlobalHomePagePCStringStyels: ThemeColorPicker = ["FFF", "#FFF"]
}
