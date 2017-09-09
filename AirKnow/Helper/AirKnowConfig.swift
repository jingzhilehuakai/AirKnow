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
    
    static let airKnowTabbarHeight: CGFloat = 40.0

    static let airKnowPromptButtonLeftPadding: CGFloat = 10
    static let airKnowPromptButtonTopPadding: CGFloat = 10
    static let airKnowPromptButtonHeight: CGFloat = airKnowTabbarHeight - 2 * airKnowPromptButtonTopPadding
    
    static let airKnowAddLocationButtonRightPadding: CGFloat = -10
    static let airKnowAddLocationButtonTopPadding: CGFloat = 10
    static let airKnowAddLocationButtonHeight: CGFloat = airKnowTabbarHeight - 2 * airKnowAddLocationButtonTopPadding
    
    static let airKnowMLLocationNameFont: UIFont = UIFont.init(name: "Futura-Medium", size: 22)!
    static let airKnowMLLocationNameLeftPadding: CGFloat = 30.0
    static let airKnowMLLocationNameRightPadding: CGFloat = -30.0
    static let airKnowMLLocationNameTopPadding: CGFloat = 55.0
    static let airKnowMLLocationNameDefaultNameString: String = "Current Location"
    
    static let airKnowMLUpdateTimeTopPadding: CGFloat = 6.5
    static let airKnowMLUpdateTimeFont: UIFont = UIFont.init(name: "EuphemiaUCAS", size:14.5)!
    static let airKnowMLUpdateTimeWidth: CGFloat = 150.0
    static let airKnowMLUpdateTimeDefaultNameString: String = "21.02.2017 17:00"
    
    static let airKnowHomePageCollectionViewEdgePadding: CGFloat = 100.0

    enum airKnowTheme: Int {
        case light = 0
        case dark  = 1
    }
    static let airKnowGlobalStatusBarStringStyles: ThemeStatusBarStylePicker = [UIStatusBarStyle.default, UIStatusBarStyle.lightContent]
    static let airKnowGlobalHomePageVCBGStringStyels: ThemeColorPicker = ["#FFFFFF", "#0B0B0B"]
    static let airKnowGlobalTabbarStringStyles: ThemeColorPicker = ["#56AF1F", "#1E1E1E"]
    static let airKnowGlobalTabbarPromptButtonImageStringStyels: ThemeImagePicker = ["tabbarPrompt_Light", "tabbarPrompt_Light"]
    static let airKnowGlobalTabbarAddLocationButtonImageStringStyels: ThemeImagePicker = ["tabbarAdd_Light", "tabbarAdd_Light"]
    static let airKnowGlobalHomePagePCStringStyels: ThemeColorPicker = ["#FFFFFF", "#FFFFFF"]
    static let airKnowGlobalMLLocationNameStringStyles: ThemeColorPicker = ["#000000", "#FFFFFF"]
    static let airKnowGlobalMLUpdateTimeStringStyles: ThemeColorPicker = ["#4A4A4A", "#4A4A4A"]
}
