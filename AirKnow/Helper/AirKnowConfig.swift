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
    
    // Lengh Ajust
    class func ajustLength(_ lengh: CGFloat) -> CGFloat {
        let screenProportion = UIScreen.main.bounds.width / 320
        return lengh * screenProportion
    }
    
    // Size Ajust
    class func ajustSize(_ size: CGSize) -> CGSize {
        let screenProportion = UIScreen.main.bounds.width / 320
        return CGSize.init(width: size.width * screenProportion, height: size.height * screenProportion)
    }
    
    // Tabbar
    static let tabbarHeight: CGFloat = AirKnowConfig.ajustLength(40.0)

    // Prompt Button
    static let promptButtonLeftPadding: CGFloat = AirKnowConfig.ajustLength(12)
    static let promptButtonTopPadding: CGFloat = AirKnowConfig.ajustLength(12)
    static let promptButtonHeight: CGFloat = tabbarHeight - 2 * promptButtonTopPadding
    
    // Add Location
    static let addLocationButtonRightPadding: CGFloat = -AirKnowConfig.ajustLength(12)
    static let addLocationButtonTopPadding: CGFloat = AirKnowConfig.ajustLength(12)
    static let addLocationButtonHeight: CGFloat = tabbarHeight - 2 * addLocationButtonTopPadding
    
    // ML LocationName Lable
    static let MLLocationNameFont: UIFont = UIFont.init(name: "Futura-Medium", size: AirKnowConfig.ajustLength(22.0))!
    static let MLLocationNameLeftPadding: CGFloat = AirKnowConfig.ajustLength(30.0)
    static let MLLocationNameRightPadding: CGFloat = -AirKnowConfig.ajustLength(30.0)
    static let MLLocationNameTopPadding: CGFloat = AirKnowConfig.ajustLength(55.0)
    
    // ML UpdateTime Lable
    static let MLUpdateTimeTopPadding: CGFloat = AirKnowConfig.ajustLength(6.5)
    static let MLUpdateTimeFont: UIFont = UIFont.init(name: "EuphemiaUCAS", size:AirKnowConfig.ajustLength(14.0))!
    static let MLUpdateTimeWidth: CGFloat = AirKnowConfig.ajustLength(150.0)
    
    // Home page CollectionView
    static let homePageCollectionViewEdgeTopPadding: CGFloat = AirKnowConfig.ajustLength(135)
    
    // Home Page AirQuality Status SC Cell
    static let homePageAirQualityStatusSectionControllerCellHeight: CGFloat = UIScreen.main.bounds.height / 5.5
    static let homePageAirQualityStatusSectionControllerCelLeftPadding: CGFloat = AirKnowConfig.ajustLength(10)
    static let homePageAirQualityStatusSectionControllerCelRightPadding: CGFloat = -AirKnowConfig.ajustLength(10)
    
    // Home Page AirQuality SC Cell
    static let homePageAirQualitySectionControllerCellHeight: CGFloat = UIScreen.main.bounds.height / 7.5
    static let homePageAirQualitySectionControllerCelLeftPadding: CGFloat = AirKnowConfig.ajustLength(10)
    static let homePageAirQualitySectionControllerCelRightPadding: CGFloat = -AirKnowConfig.ajustLength(10)
    // Home Page AirQuality SC Cell PMN
    static let homePageAirQualitySectionControllerCelPMNHeight: CGFloat = AirKnowConfig.ajustLength(15.0)
    static let homePageAirQualitySectionControllerCelPMNWidth: CGFloat = AirKnowConfig.homePageAirQualitySectionControllerCelPMPNWidth + AirKnowConfig.homePageAirQualitySectionControllerCelPNWidth + AirKnowConfig.homePageAirQualitySectionControllerCelPUWidth + 2 * homePageAirQualitySectionControllerCellElementsPadding
    static let homePageAirQualitySectionControllerCelPMNLeftPadding: CGFloat = AirKnowConfig.ajustLength(10)
    static let homePageAirQualitySectionControllerCelPMNTopPadding: CGFloat = AirKnowConfig.ajustLength(13.5)
    static let homePageAirQualitySectionControllerCelPMNFont: UIFont = UIFont.init(name: "HiraKakuProN-W3", size: AirKnowConfig.ajustLength(12.5))!
    // Home Page AirQuality SC Cell PMPN
    static let homePageAirQualitySectionControllerCelPMPNFont: UIFont = UIFont.init(name: "HiraKakuProN-W3", size: AirKnowConfig.ajustLength(13.5))!
    static let homePageAirQualitySectionControllerCelPMPNTopPadding: CGFloat = AirKnowConfig.ajustLength(8.0)
    static let homePageAirQualitySectionControllerCelPMPNBottomPadding: CGFloat = -AirKnowConfig.homePageAirQualitySectionControllerCelPMPNTopPadding
    static let homePageAirQualitySectionControllerCelPMPNWidth: CGFloat = UIScreen.main.bounds.width / 6
    static let homePageAirQualitySectionControllerCelPMPNheight: CGFloat = AirKnowConfig.homePageAirQualitySectionControllerCellHeight / 2.5
    // Home Page AirQuality SC Cell PN
    static let homePageAirQualitySectionControllerCelPNWidth: CGFloat = UIScreen.main.bounds.width / 8
    static let homePageAirQualitySectionControllerCelPNFont: UIFont = UIFont.init(name: "HiraKakuProN-W3", size: AirKnowConfig.ajustLength(19.5))!
    // Home Page AirQuality SC Cell PU
    static let homePageAirQualitySectionControllerCelPUWidth: CGFloat = UIScreen.main.bounds.width / 9.5
    static let homePageAirQualitySectionControllerCelPUFont: UIFont = UIFont.init(name: "HiraKakuProN-W3", size: AirKnowConfig.ajustLength(10.0))!
    // Home Page AirQuality SC Cell Line
    static let homePageAirQualitySectionControllerCelLineWidth: CGFloat = 1.0
    static let homePageAirQualitySectionControllerCelLineLeftPadding: CGFloat = AirKnowConfig.ajustLength(10.0)
    // Home Page AirQuality SC Global Settiing
    static let homePageAirQualitySectionControllerCellElementsPadding: CGFloat = AirKnowConfig.ajustLength(2.0)
    // Home Page AirQuality SC Cell Percent Number
    static let homePageAirQualitySectionControllerCelPercentNumberFont: UIFont = AirKnowConfig.homePageAirQualitySectionControllerCelPNFont
    static let homePageAirQualitySectionControllerCelPercentNumberLeftPadding: CGFloat = AirKnowConfig.ajustLength(10.0)
    // Home Page AirQuality SC Cell Normal Standard Number
    static let homePageAirQualitySectionControllerCelNSNRightPadding: CGFloat = -AirKnowConfig.ajustLength(10.0)
    static let homePageAirQualitySectionControllerCelNSNLeftPadding: CGFloat = AirKnowConfig.ajustLength(10.0)
    static let homePageAirQualitySectionControllerCelNSNFont: UIFont = UIFont.init(name: "HiraKakuProN-W3", size: AirKnowConfig.ajustLength(10.0))!
    
    // Theme Setting
    enum airKnowTheme: Int {
        case light = 0
        case dark  = 1
    }
    static let statusBarStringStyles: ThemeStatusBarStylePicker = [UIStatusBarStyle.default, UIStatusBarStyle.lightContent]
    static let homePageVCBGStringStyels: ThemeColorPicker = ["#FAFAFA", "#030303"]
    static let tabbarStringStyles: ThemeColorPicker = ["#45BB7C", "#1E1E1E"]
    static let tabbarPromptButtonImageStringStyels: ThemeImagePicker = ["tabbarPrompt_DayMode", "tabbarPrompt_nightMode"]
    static let tabbarAddLocationButtonImageStringStyels: ThemeImagePicker = ["tabbarAdd_Light", "tabbarAdd_Light"]
    static let homePagePCStringStyels: ThemeColorPicker = ["#FFFFFF", "#FFFFFF"]
    static let MLLocationNameStringStyles: ThemeColorPicker = ["#000000", "#FFFFFF"]
    static let MLUpdateTimeStringStyles: ThemeColorPicker = ["#4A4A4A", "#4A4A4A"]
    static let MLNoDataBGStringStyles: ThemeColorPicker = ["#FFFFFF", "#0D0D0D"]
    static let homePageAirQualityStatusSectionControllerCellBGStringStyles: ThemeColorPicker = ["#FFFFFF", "#0D0D0D"]
    static let homePageAirQualitySectionControllerCellSMNStringStyles: ThemeColorPicker = ["#999999", "#494949"]
    static let homePageAirQualitySectionControllerCellNODataBGStringStyles: ThemeColorPicker = ["#FAFAFA", "#030303"]
    static let homePageAirQualitySectionControllerCellSMPNStringStyles: ThemeColorPicker = ["#313131", "#7A7A7A"]
    static let homePageAirQualitySectionControllerCellPNStringStyles: ThemeColorPicker = ["#313131", "#FFFFFF"]
    static let homePageAirQualitySectionControllerCellPUStringStyles: ThemeColorPicker = ["#313131", "#949494"]
    static let homePageAirQualitySectionControllerCellLineStringStyles: ThemeColorPicker = ["#DCDCDC", "#1C1C1C"]
    static let homePageAirQualitySectionControllerCellPercentNumberStringStyles: ThemeColorPicker = ["#313131", "#FFFFFF"]
    static let homePageAirQualitySectionControllerCellNormalHolderStringStyles: ThemeColorPicker = ["#999999", "#494949"]
    static let homePageAirQualitySectionControllerCellNormalStandardStringStyles: ThemeColorPicker = ["#313131", "#7A7A7A"]
}

// MARK: - The Configuration of AirQualityStatusView
extension AirKnowConfig {
    
    // AirQualityStatusView TitleButton
    static let airKnowAQSTitleButtonFont: UIFont = UIFont(name: "Futura-Medium", size: 24)!
    static let airKnowAQSTitleButtonLeftPadding: CGFloat = AirKnowConfig.ajustLength(10)
    static let airKnowAQSTitleButtonRightPadding: CGFloat = -AirKnowConfig.ajustLength(10)
    static let airKnowAQSTitleButtonHeight: CGFloat = AirKnowConfig.ajustLength(35)
    static let airKnowAQSTitleButtonDefaultNameString: String = "Good"
    
    // AirQualityStatusView TriangleIndicator
    static let airKnowAQSTriangleIndicatorTopPadding: CGFloat = AirKnowConfig.ajustLength(10)
    static let airKnowAQSTriangleIndicatorHeight: CGFloat = AirKnowConfig.ajustLength(5)
    static let airKnowAQSTriangleIndicatorWidth: CGFloat = AirKnowConfig.ajustLength(16)

    // AirQualityStatusView ProgressView
    static let airKnowAQSProgressTopPadding: CGFloat = AirKnowConfig.ajustLength(5)
    static let airKnowAQSProgressHeight: CGFloat = AirKnowConfig.ajustLength(20)
    static let airKnowAQSProgressSectionWidth: CGFloat = AirKnowConfig.ajustLength(39)
    static let airKnowAQSProgressLineWidth: CGFloat = AirKnowConfig.ajustLength(1)
    
    static let airKnowAQSProgressBackgroundStyles: ThemeCGColorPicker = ["#4A4A4A", "#4A4A4A"]
    static let airKnowAQSProgressLineStyles: ThemeCGColorPicker = ["#000000", "#000000"]
    
    // AirQualityStatusView DescriptionLabel
    static let airKnowAQSDescriptionLabelFont: UIFont = UIFont(name: "EuphemiaUCAS", size: AirKnowConfig.ajustLength(15))!
    static let airKnowAQSDescriptionLabelLeftPadding: CGFloat = AirKnowConfig.ajustLength(10)
    static let airKnowAQSDescriptionLabelRightPadding: CGFloat = -AirKnowConfig.ajustLength(10)
    static let airKnowAQSDescriptionLabelTopPadding: CGFloat = AirKnowConfig.ajustLength(10)
    static let airKnowAQSDescriptionLabelHeight: CGFloat = AirKnowConfig.ajustLength(20)
    static let airKnowAQSDescriptionLabelDefaultNameString: String = "Perfect Quilty!"
    
    static let airKnowAQSDescriptionLabelStringStyles: ThemeColorPicker = ["#4A4A4A", "#4A4A4A"]
    
    // AirQualityStatusView Status
    static let airKonwAQSTypeCount: NSInteger = 6
    
    static let airKnowAQSGoodStyles: ThemeColorPicker = ["#009966", "#009966"]
    static let airKnowAQSModerateStyles: ThemeColorPicker = ["#ffde33", "#ffde33"]
    static let airKnowAQSUnhealthyForSensitiveGroupsStyles: ThemeColorPicker = ["#FF9933", "#FF9933"]
    static let airKnowAQSUnhealthyStyles: ThemeColorPicker = ["#CC0033", "#CC0033"]
    static let airKnowAQSVeryUnhealthyStyles: ThemeColorPicker = ["#660099", "#660099"]
    static let airKnowAQSHazardousStyles: ThemeColorPicker = ["#7E0023", "#7E0023"]
}
