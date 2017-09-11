//
//  HomePageAirQualitySectionControllerCell.swift
//  AirKnow
//
//  Created by 陈超邦 on 2017/9/9.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit

class HomePageAirQualitySectionControllerCell: UICollectionViewCell {
    
    // Circle BG
    lazy var circleBackgroundView: UIView = {
        let circleBackgroundViewInternal = UIView()
        circleBackgroundViewInternal.theme_backgroundColor = AirKnowConfig.homePageAirQualityStatusSectionControllerCellBGStringStyles
        circleBackgroundViewInternal.layer.cornerRadius = 2
        return circleBackgroundViewInternal
    }()
    
    // Pollution Material Name
    lazy var pollutionMaterialName : PlaceholderLabel = {
        let pollutionMaterialNameInternal = PlaceholderLabel()
        pollutionMaterialNameInternal.theme_textColor = AirKnowConfig.homePageAirQualitySectionControllerCellSMNStringStyles
        pollutionMaterialNameInternal.textAlignment = NSTextAlignment.left
        pollutionMaterialNameInternal.font = AirKnowConfig.homePageAirQualitySectionControllerCelPMNFont
        pollutionMaterialNameInternal.theme_backgroundColor = AirKnowConfig.homePageAirQualitySectionControllerCellNODataBGStringStyles
        pollutionMaterialNameInternal.layer.cornerRadius = 2
        return pollutionMaterialNameInternal
    }()
    
    // Pollution Material Profession Name
    lazy var pollutionMaterialProfessionName: PlaceholderLabel = {
        let pollutionMaterialProfessionNameInternal = PlaceholderLabel()
        pollutionMaterialProfessionNameInternal.textAlignment = NSTextAlignment.left
        pollutionMaterialProfessionNameInternal.font = AirKnowConfig.homePageAirQualitySectionControllerCelPMPNFont
        pollutionMaterialProfessionNameInternal.layer.cornerRadius = 2
        pollutionMaterialProfessionNameInternal.theme_textColor = AirKnowConfig.homePageAirQualitySectionControllerCellSMPNStringStyles
        pollutionMaterialProfessionNameInternal.theme_backgroundColor = AirKnowConfig.homePageAirQualitySectionControllerCellNODataBGStringStyles
        return pollutionMaterialProfessionNameInternal
    }()
    
    // Pollution Material Pollution Number
    lazy var pollutionNumber: PlaceholderLabel = {
        let pollutionNumberInternal = PlaceholderLabel()
        pollutionNumberInternal.theme_textColor = AirKnowConfig.homePageAirQualitySectionControllerCellPNStringStyles
        pollutionNumberInternal.font = AirKnowConfig.homePageAirQualitySectionControllerCelPNFont
        pollutionNumberInternal.textAlignment = NSTextAlignment.center
        pollutionNumberInternal.layer.cornerRadius = 2
        pollutionNumberInternal.theme_backgroundColor = AirKnowConfig.homePageAirQualitySectionControllerCellNODataBGStringStyles
        return pollutionNumberInternal
    }()
    
    // Pollution Material Pollution Unit
    lazy var pollutionUnit: PlaceholderLabel = {
        let pollutionUnitInternal = PlaceholderLabel()
        pollutionUnitInternal.theme_textColor = AirKnowConfig.homePageAirQualitySectionControllerCellPUStringStyles
        pollutionUnitInternal.font = AirKnowConfig.homePageAirQualitySectionControllerCelPUFont
        pollutionUnitInternal.textAlignment = NSTextAlignment.left
        pollutionUnitInternal.layer.cornerRadius = 2
        pollutionUnitInternal.theme_backgroundColor = AirKnowConfig.homePageAirQualitySectionControllerCellNODataBGStringStyles
        return pollutionUnitInternal
    }()
    
    // Two Separated Line
    lazy var lineF: UIView = {
        let lineFInternal = UIView()
        lineFInternal.theme_backgroundColor = AirKnowConfig.homePageAirQualitySectionControllerCellLineStringStyles
        return lineFInternal
    }()
    lazy var lineS: UIView = {
        let lineSInternal = UIView()
        lineSInternal.theme_backgroundColor = AirKnowConfig.homePageAirQualitySectionControllerCellLineStringStyles
        return lineSInternal
    }()
    
    // Percent Number Label
    lazy var percentageNumber: PlaceholderLabel = {
        let percentageNumberInternal = PlaceholderLabel()
        percentageNumberInternal.theme_textColor = AirKnowConfig.homePageAirQualitySectionControllerCellPercentNumberStringStyles
        percentageNumberInternal.textAlignment = NSTextAlignment.center
        percentageNumberInternal.theme_backgroundColor = AirKnowConfig.homePageAirQualitySectionControllerCellNODataBGStringStyles

        percentageNumberInternal.layer.cornerRadius = 2
        return percentageNumberInternal
    }()
    
    // Normal Standard Number
    lazy var normalStandardNumber: PlaceholderLabel = {
        let normalStandardNumberInternal = PlaceholderLabel()
        normalStandardNumberInternal.theme_backgroundColor = AirKnowConfig.homePageAirQualitySectionControllerCellNODataBGStringStyles
        normalStandardNumberInternal.font = AirKnowConfig.homePageAirQualitySectionControllerCelNSNFont
        normalStandardNumberInternal.textAlignment = NSTextAlignment.left
        normalStandardNumberInternal.theme_textColor = AirKnowConfig.homePageAirQualitySectionControllerCellNormalStandardStringStyles
        return normalStandardNumberInternal
    }()
    
    // "NORMAL" Holder Label
    lazy var normalHolderLabel: PlaceholderLabel = {
        let normalHolderLabelINternal = PlaceholderLabel()
        normalHolderLabelINternal.textAlignment = NSTextAlignment.left
        normalHolderLabelINternal.font = UIFont.systemFont(ofSize: 8.0)
        normalHolderLabelINternal.theme_backgroundColor = AirKnowConfig.homePageAirQualitySectionControllerCellNODataBGStringStyles
        normalHolderLabelINternal.theme_textColor = AirKnowConfig.homePageAirQualitySectionControllerCellNormalHolderStringStyles
        return normalHolderLabelINternal
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        func layoutCircleBackgroundView() {
            self.contentView.addSubview(circleBackgroundView)
            circleBackgroundView.snp.makeConstraints { (make) in
                make.left.equalTo(self.contentView.snp.left).offset(AirKnowConfig.homePageAirQualitySectionControllerCelLeftPadding)
                make.right.equalTo(self.contentView.snp.right).offset(AirKnowConfig.homePageAirQualitySectionControllerCelRightPadding)
                make.top.equalTo(self.contentView.snp.top)
                make.bottom.equalTo(self.contentView.snp.bottom)
            }
        }
        layoutCircleBackgroundView()
        
        func layoutPollutionMaterialName() {
            circleBackgroundView.addSubview(pollutionMaterialName)
            pollutionMaterialName.snp.makeConstraints { (make) in
                make.left.equalTo(circleBackgroundView.snp.left).offset(AirKnowConfig.homePageAirQualitySectionControllerCelPMNLeftPadding)
                make.top.equalTo(circleBackgroundView.snp.top).offset(AirKnowConfig.homePageAirQualitySectionControllerCelPMNTopPadding)
                make.width.equalTo(AirKnowConfig.homePageAirQualitySectionControllerCelPMNWidth)
                make.height.equalTo(AirKnowConfig.homePageAirQualitySectionControllerCelPMNHeight)
            }
        }
        layoutPollutionMaterialName()
        
        func layoutPollutionMaterialProfessionName() {
            circleBackgroundView.addSubview(pollutionMaterialProfessionName)
            pollutionMaterialProfessionName.snp.makeConstraints { (make) in
                make.left.equalTo(pollutionMaterialName.snp.left)
                make.top.equalTo(pollutionMaterialName.snp.bottom).offset(AirKnowConfig.homePageAirQualitySectionControllerCelPMPNTopPadding)
                make.bottom.equalTo(circleBackgroundView.snp.bottom).offset(AirKnowConfig.homePageAirQualitySectionControllerCelPMPNBottomPadding)
                make.width.equalTo(AirKnowConfig.homePageAirQualitySectionControllerCelPMPNWidth)
                make.height.greaterThanOrEqualTo(AirKnowConfig.homePageAirQualitySectionControllerCelPMPNheight)
            }
        }
        layoutPollutionMaterialProfessionName()
        
        func layoutPollutionNumber() {
            circleBackgroundView.addSubview(pollutionNumber)
            pollutionNumber.snp.makeConstraints { (make) in
                make.left.equalTo(pollutionMaterialProfessionName.snp.right).offset(AirKnowConfig.homePageAirQualitySectionControllerCellElementsPadding)
                make.bottomMargin.equalTo(pollutionMaterialProfessionName.snp.bottomMargin)
                make.topMargin.equalTo(pollutionMaterialProfessionName.snp.topMargin)
                make.width.equalTo(AirKnowConfig.homePageAirQualitySectionControllerCelPNWidth)
            }
        }
        layoutPollutionNumber()
        
        func layoutPollutionUnit() {
            circleBackgroundView.addSubview(pollutionUnit)
            pollutionUnit.snp.makeConstraints { (make) in
                make.left.equalTo(pollutionNumber.snp.right).offset(AirKnowConfig.homePageAirQualitySectionControllerCellElementsPadding)
                make.bottomMargin.equalTo(pollutionNumber.snp.bottomMargin)
                make.top.equalTo(pollutionNumber.snp.top)
                make.width.equalTo(AirKnowConfig.homePageAirQualitySectionControllerCelPUWidth)
            }
        }
        layoutPollutionUnit()
        
        func layoutLineF() {
            circleBackgroundView.addSubview(lineF)
            lineF.snp.makeConstraints { (make) in
                make.left.equalTo(pollutionUnit.snp.right).offset(AirKnowConfig.homePageAirQualitySectionControllerCelLineLeftPadding)
                make.top.equalTo(pollutionNumber.snp.top)
                make.bottom.equalTo(pollutionUnit.snp.bottom)
                make.width.equalTo(AirKnowConfig.homePageAirQualitySectionControllerCelLineWidth)
            }
        }
        layoutLineF()
        
        func layoutPercentageNumber() {
            circleBackgroundView.addSubview(percentageNumber)
            percentageNumber.snp.makeConstraints { (make) in
                make.bottom.equalTo(lineF.snp.bottom)
                make.top.equalTo(pollutionNumber.snp.top)
                make.left.equalTo(lineF.snp.right).offset(AirKnowConfig.homePageAirQualitySectionControllerCelPercentNumberLeftPadding)
            }
        }
        layoutPercentageNumber()
        
        func layoutLineS() {
            circleBackgroundView.addSubview(lineS)
            lineS.snp.makeConstraints { (make) in
                make.left.equalTo(percentageNumber.snp.right).offset(AirKnowConfig.homePageAirQualitySectionControllerCelLineLeftPadding)
                make.width.equalTo(1)
                make.topMargin.equalTo(lineF.snp.topMargin)
                make.bottomMargin.equalTo(lineF.snp.bottomMargin)
            }
        }
        layoutLineS()
        
        func layoutNormalStandardNumber() {
            circleBackgroundView.addSubview(normalStandardNumber)
            normalStandardNumber.snp.makeConstraints { (make) in
                make.width.equalTo(percentageNumber.snp.width)
                make.left.equalTo(lineS.snp.right).offset(AirKnowConfig.homePageAirQualitySectionControllerCelNSNLeftPadding)
                make.bottomMargin.equalTo(percentageNumber.snp.bottomMargin)
                make.height.equalTo(pollutionUnit.snp.height).multipliedBy(0.5)
                make.right.equalTo(circleBackgroundView.snp.right).offset(AirKnowConfig.homePageAirQualitySectionControllerCelNSNRightPadding)
            }
        }
        layoutNormalStandardNumber()
        
        func layoutNormalHolderLabel() {
            circleBackgroundView.addSubview(normalHolderLabel)
            normalHolderLabel.snp.makeConstraints { (make) in
                make.leftMargin.equalTo(normalStandardNumber.snp.leftMargin)
                make.rightMargin.equalTo(normalStandardNumber.snp.rightMargin)
                make.topMargin.equalTo(lineS.snp.topMargin)
                make.bottom.equalTo(normalStandardNumber.snp.top).offset(-AirKnowConfig.homePageAirQualitySectionControllerCellElementsPadding)
            }
        }
        layoutNormalHolderLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
