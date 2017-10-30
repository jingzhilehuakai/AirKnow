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
import SwifterSwift

final class AirKnowConfig {
    
    //MARK: Fix 'addChildControl' problem
    static let shouldFIxTabbarInset: Bool = {
        if UIScreen.main.bounds.width > 320 {
            return true
        } else {
            return false
        }
    }()
    
    class func colorWithAQI(_ number: Int) -> UIColor {
        if number >= 0 && number <= 50 {
            return UIColor.init(hex: "#009966")
        } else if number > 50 && number <= 100 {
            return UIColor.init(hex: "#FDDC33")
        } else if number > 100 && number <= 150 {
            return UIColor.init(hex: "#FF9933")
        } else if number > 150 && number <= 200 {
            return UIColor.init(hex: "#CC0033")
        } else if number > 200 && number <= 300 {
            return UIColor.init(hex: "#660099")
        } else if number > 300 {
            return UIColor.init(hex: "#7E0023")
        } else {
            return UIColor.black
        }
    }
    
    //MARK: Lengh Ajust
    class func ajustLength(_ lengh: CGFloat) -> CGFloat {
        let screenProportion = UIScreen.main.bounds.width / 320
        return lengh * screenProportion
    }
    
    //MARK: Size Ajust
    class func ajustSize(_ size: CGSize) -> CGSize {
        let screenProportion = UIScreen.main.bounds.width / 320
        return CGSize.init(width: size.width * screenProportion, height: size.height * screenProportion)
    }
    
    //MARK: Theme Setting
    enum airKnowTheme: Int {
        case light = 0
        case dark  = 1
    }
    
    //MARK: SearchVC
    static let searchVCHeight: CGFloat = AirKnowConfig.ajustLength(450)
    static let searchBarTextFont: UIFont = UIFont.init(name: "HiraKakuProN-W3", size: AirKnowConfig.ajustLength(15))!
    static let searchBarHeight: CGFloat = AirKnowConfig.ajustLength(36)
    static let searchBarLeftPadding: CGFloat = AirKnowConfig.ajustLength(10)
    static let searchBarRightPadding: CGFloat = -AirKnowConfig.ajustLength(10)
    static let searchBarTopPadding: CGFloat = AirKnowConfig.ajustLength(10)
    static let searchContentCellHieght = 60
    static let searchContentTextColorStyle: ThemeColorPicker = ["#000000", "#FFFFFF"]
    static let searchContentTextFont = UIFont.init(name: "HiraKakuProN-W3", size: AirKnowConfig.ajustLength(12))!
    static let searchTagViewWidth = 60
    
    //MARK: NoData View Side Length
    static let noDataViewSideLength: CGFloat = 100
    static let noDataViewCenterYOffset: CGFloat = -50
    static let noDataViewImageStyles: ThemeImagePicker = ["nodata_dark", "nodata_light"]
    static let noDataViewTitleString: String = "No valid location, click \"+\" button to add"
    static let noDataViewTitleTopInset: CGFloat = 10
    static let noDataViewTitleBackgroundColorStyles: ThemeColorPicker = ["#000000", "#FFFFFF"]

    //MARK: Domain
    static let networkServiceErrorDomain = "com.airknow.networkError"
    enum airKnowNetworkError: Int {
        case inputDataErrorCode = 4000
        case responseDataHandlerCode = 4001
        case networkLinkErrorCode = 4002
        case modelDeserializeError = 4003
    }
    
    //MARK: Status
    static let statusBarStyles: ThemeStatusBarStylePicker = [UIStatusBarStyle.default, UIStatusBarStyle.lightContent]
    
    //MARK: Homepage ViewController Background
    static let homePageVCBGStyles: ThemeColorPicker = ["#FAFAFA", "#030303"]
    
    //MARK: Associate Object
    static let homePageSectionViewControllerCellAssociateString = "homePageSectionViewControllerCellAssociateString"
    
    //MARK: Tabbar
    static let tabbarHeight: CGFloat = AirKnowConfig.ajustLength(40.0)
    static let tabbarStyles: ThemeColorPicker = ["#45BB7C", "#1E1E1E"]

    //MARK: Prompt Button
    static let promptButtonLeftPadding: CGFloat = AirKnowConfig.ajustLength(12)
    static let promptButtonTopPadding: CGFloat = AirKnowConfig.ajustLength(12)
    static let promptButtonHeight: CGFloat = tabbarHeight - 2 * promptButtonTopPadding
    static let promptButtonImageStyles: ThemeImagePicker = ["tabbarPrompt_dayMode", "tabbarPrompt_nightMode"]

    //MARK: Homepage PageControl
    static let homePagePageControllerStyles: ThemeColorPicker = ["#FFFFFF", "#FFFFFF"]
    
    //MARK: Add Location
    static let addLocationButtonRightPadding: CGFloat = -AirKnowConfig.ajustLength(12)
    static let addLocationButtonTopPadding: CGFloat = AirKnowConfig.ajustLength(12)
    static let addLocationButtonHeight: CGFloat = tabbarHeight - 2 * addLocationButtonTopPadding
    static let addLocationButtonImageStyles: ThemeImagePicker = ["tabbarAdd_Light", "tabbarAdd_Light"]

    //MARK: ML LocationName Lable
    static let MLLocationNameFont: UIFont = UIFont.init(name: "HelveticaNeue-Light", size: AirKnowConfig.ajustLength(22.0))!
    static let MLLocationNameLeftPadding: CGFloat = AirKnowConfig.ajustLength(30.0)
    static let MLLocationNameRightPadding: CGFloat = -AirKnowConfig.ajustLength(30.0)
    static let MLLocationNameTopPadding: CGFloat = AirKnowConfig.ajustLength(55.0)
    static let MLLocationNameStyles: ThemeColorPicker = ["#000000", "#FFFFFF"]

    //MARK: ML UpdateTime Lable
    static let MLUpdateTimeTopPadding: CGFloat = AirKnowConfig.ajustLength(6.5)
    static let MLUpdateTimeFont: UIFont = UIFont.init(name: "EuphemiaUCAS", size:AirKnowConfig.ajustLength(14.0))!
    static let MLUpdateTimeWidth: CGFloat = AirKnowConfig.ajustLength(150.0)
    static let MLUpdateTimeStyles: ThemeColorPicker = ["#4A4A4A", "#4A4A4A"]

    //MARK: Homepage CollectionView
    static let homePageCollectionViewEdgeTopPadding: CGFloat = AirKnowConfig.ajustLength(135)
    
    //MARK: Homepage AirQuality Status SC Cell
    static let homePageAirQualityStatusSectionControllerCellHeight: CGFloat = UIScreen.main.bounds.height / 6.5
    static let homePageAirQualityStatusSectionControllerCelLeftPadding: CGFloat = AirKnowConfig.ajustLength(10)
    static let homePageAirQualityStatusSectionControllerCelRightPadding: CGFloat = -AirKnowConfig.ajustLength(10)
    static let homePageAirQualityStatusSectionControllerCellBGStyles: ThemeColorPicker = ["#FFFFFF", "#0D0D0D"]

    //MARK: Homepage AirQuality SC Cell
    static let homePageAirQualitySectionControllerCellHeight: CGFloat = UIScreen.main.bounds.height / 7.5
    static let homePageAirQualitySectionControllerCelLeftPadding: CGFloat = AirKnowConfig.ajustLength(10)
    static let homePageAirQualitySectionControllerCelRightPadding: CGFloat = -AirKnowConfig.ajustLength(10)

    //MARK: Homepage AirQuality SC Cell Polltion Material Name
    static let homePageAirQualitySectionControllerCelPMNHeight: CGFloat = AirKnowConfig.ajustLength(15.0)
    static let homePageAirQualitySectionControllerCelPMNWidth: CGFloat = AirKnowConfig.homePageAirQualitySectionControllerCelPMPNWidth + AirKnowConfig.homePageAirQualitySectionControllerCelPNWidth + AirKnowConfig.homePageAirQualitySectionControllerCelPUWidth + 2 * homePageAirQualitySectionControllerCellElementsPadding
    static let homePageAirQualitySectionControllerCelPMNLeftPadding: CGFloat = AirKnowConfig.ajustLength(10)
    static let homePageAirQualitySectionControllerCelPMNTopPadding: CGFloat = AirKnowConfig.ajustLength(13.5)
    static let homePageAirQualitySectionControllerCelPMNFont: UIFont = UIFont.init(name: "HiraKakuProN-W3", size: AirKnowConfig.ajustLength(12.5))!
    static let homePageAirQualitySectionControllerCellPMNStyles: ThemeColorPicker = ["#999999", "#494949"]

    //MARK: Homepage AirQuality SC Cell Pollution Material Profession Name
    static let homePageAirQualitySectionControllerCelPMPNFont: UIFont = UIFont.init(name: "HiraKakuProN-W3", size: AirKnowConfig.ajustLength(13.5))!
    static let homePageAirQualitySectionControllerCelPMPNTopPadding: CGFloat = AirKnowConfig.ajustLength(8.0)
    static let homePageAirQualitySectionControllerCelPMPNBottomPadding: CGFloat = -AirKnowConfig.homePageAirQualitySectionControllerCelPMPNTopPadding
    static let homePageAirQualitySectionControllerCelPMPNWidth: CGFloat = UIScreen.main.bounds.width / 6
    static let homePageAirQualitySectionControllerCelPMPNheight: CGFloat = AirKnowConfig.homePageAirQualitySectionControllerCellHeight / 2.5
    static let homePageAirQualitySectionControllerCellPMPNStyles: ThemeColorPicker = ["#313131", "#7A7A7A"]

    
    //MARK: Homepage AirQuality SC Cell Pollution Number
    static let homePageAirQualitySectionControllerCelPNWidth: CGFloat = UIScreen.main.bounds.width / 10
    static let homePageAirQualitySectionControllerCelPNFont: UIFont = UIFont.init(name: "Optima-Regular", size: AirKnowConfig.ajustLength(15.0))!
    static let homePageAirQualitySectionControllerCellPNStyles: ThemeColorPicker = ["#313131", "#FFFFFF"]

    //MARK: Homepage AirQuality SC Cell Pollution Unit
    static let homePageAirQualitySectionControllerCelPUWidth: CGFloat = UIScreen.main.bounds.width / 9.5
    static let homePageAirQualitySectionControllerCelPUFont: UIFont = UIFont.init(name: "HiraKakuProN-W3", size: AirKnowConfig.ajustLength(7.5))!
    static let homePageAirQualitySectionControllerCellPUStyles: ThemeColorPicker = ["#313131", "#949494"]

    //MARK: Homepage AirQuality SC Cell Line
    static let homePageAirQualitySectionControllerCelLineWidth: CGFloat = 1.0
    static let homePageAirQualitySectionControllerCelLineLeftPadding: CGFloat = AirKnowConfig.ajustLength(10.0)
    static let homePageAirQualitySectionControllerCellLineStyles: ThemeColorPicker = ["#DCDCDC", "#1C1C1C"]

    //MARK: Homepage AirQuality SC Global Settiing
    static let homePageAirQualitySectionControllerCellElementsPadding: CGFloat = AirKnowConfig.ajustLength(1.0)
    
    //MARK: Homepage AirQuality SC Cell Percent Number
    static let homePageAirQualitySectionControllerCelPercentNumberFont: UIFont = UIFont.init(name: "Optima-Regular", size: AirKnowConfig.ajustLength(13.5))!
    static let homePageAirQualitySectionControllerCelPercentNumberLeftPadding: CGFloat = AirKnowConfig.ajustLength(10.0)
    static let homePageAirQualitySectionControllerCellPercentNumberStyles: ThemeColorPicker = ["#313131", "#FFFFFF"]

    //MARK: Homepage AirQuality SC Cell Normal Standard Number
    static let homePageAirQualitySectionControllerCelNSNRightPadding: CGFloat = -AirKnowConfig.ajustLength(10.0)
    static let homePageAirQualitySectionControllerCelNSNLeftPadding: CGFloat = AirKnowConfig.ajustLength(10.0)
    static let homePageAirQualitySectionControllerCelNSNFont: UIFont = UIFont.init(name: "HiraKakuProN-W3", size: AirKnowConfig.ajustLength(9.0))!
    static let homePageAirQualitySectionControllerCellNormalStandardStyles: ThemeColorPicker = ["#313131", "#7A7A7A"]
    
    //MARK: Holder Label
    static let homePageAirQualitySectionControllerCellNormalHolderStyles: ThemeColorPicker = ["#999999", "#494949"]
    
    //MARK: Graph View
    static let homePageAirQualityHistoryGraphViewHeight: CGFloat = 150
}

// MARK: - The Configuration of AirQualityStatusView
extension AirKnowConfig {
    
    // AirQualityStatusView TitleButton
    static let airKnowAQSTitleButtonFont: UIFont = UIFont(name: "GurmukhiMN-Bold", size: AirKnowConfig.ajustLength(25.0))!
    static let airKnowAQSTitleButtonLeftPadding: CGFloat = AirKnowConfig.ajustLength(50)
    static let airKnowAQSTitleButtonRightPadding: CGFloat = -AirKnowConfig.ajustLength(50)
    static let airKnowAQSTitleButtonTopPadding: CGFloat = AirKnowConfig.ajustLength(0)
    static let airKnowAQSTitleButtonHeight: CGFloat = AirKnowConfig.ajustLength(32)
    
    // AirQualityStatusView TriangleIndicator
    static let airKnowAQSTriangleIndicatorTopPadding: CGFloat = AirKnowConfig.ajustLength(0)
    static let airKnowAQSTriangleIndicatorHeight: CGFloat = AirKnowConfig.ajustLength(8)
    static let airKnowAQSTriangleIndicatorWidth: CGFloat = AirKnowConfig.ajustLength(8)
    static let airKnowAQSTriangleIndicatorImageStyles: ThemeImagePicker = ["triangleIndicator_gray", "triangleIndicator_white"]
    
    // AirQualityStatusView ProgressView
    static let airKnowAQSProgressTopPadding: CGFloat = AirKnowConfig.ajustLength(1)
    static let airKnowAQSProgressHeight: CGFloat = AirKnowConfig.ajustLength(3)
    static let airKnowAQSProgressSectionWidth: CGFloat = AirKnowConfig.ajustLength(10)
    static let airKnowAQSProgressLineWidth: CGFloat = AirKnowConfig.ajustLength(0.5)
    static let airKnowAQSProgressBackgroundStyles: ThemeCGColorPicker = ["#DCDCDC", "#4A4A4A"]
    static let airKnowAQSProgressLineStyles: ThemeCGColorPicker = ["#FFFFFF", "#000000"]
    
    // AirQualityStatusView DescriptionLabel
    static let airKnowAQSDescriptionLabelFont: UIFont = UIFont(name: "Copperplate", size: AirKnowConfig.ajustLength(10))!
    static let airKnowAQSDescriptionLabelLeftPadding: CGFloat = AirKnowConfig.ajustLength(10)
    static let airKnowAQSDescriptionLabelRightPadding: CGFloat = -AirKnowConfig.ajustLength(10)
    static let airKnowAQSDescriptionLabelTopPadding: CGFloat = AirKnowConfig.ajustLength(2)
    static let airKnowAQSDescriptionLabelBottomPadding: CGFloat = AirKnowConfig.ajustLength(0)
    static let airKnowAQSDescriptionLabelHeight: CGFloat = AirKnowConfig.ajustLength(20)
    static let airKnowAQSDescriptionLabelStyles: ThemeColorPicker = ["#4A4A4A", "#4A4A4A"]
    
    // AirQualityStatusView Status
    static let airKonwAQSLevelCount: NSInteger = 6
    
    static let airKnowAQSGoodStyles: ThemeColorPicker = ["#009966", "#009966"]
    static let airKnowAQSModerateStyles: ThemeColorPicker = ["#ffde33", "#ffde33"]
    static let airKnowAQSUnhealthyForSensitiveGroupsStyles: ThemeColorPicker = ["#FF9933", "#FF9933"]
    static let airKnowAQSUnhealthyStyles: ThemeColorPicker = ["#CC0033", "#CC0033"]
    static let airKnowAQSVeryUnhealthyStyles: ThemeColorPicker = ["#660099", "#660099"]
    static let airKnowAQSHazardousStyles: ThemeColorPicker = ["#7E0023", "#7E0023"]
    
    static let airKnowAQSViewHeight: CGFloat = airKnowAQSTitleButtonTopPadding + airKnowAQSTitleButtonHeight + airKnowAQSTriangleIndicatorTopPadding + airKnowAQSTriangleIndicatorHeight + airKnowAQSProgressTopPadding + airKnowAQSProgressHeight + airKnowAQSDescriptionLabelTopPadding + airKnowAQSDescriptionLabelHeight + airKnowAQSDescriptionLabelBottomPadding
}
