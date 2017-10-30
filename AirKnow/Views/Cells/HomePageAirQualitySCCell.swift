//
//  HomePageAirQualitySectionControllerCell.swift
//  AirKnow
//
//  Created by 陈超邦 on 2017/9/9.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit

class HomePageAirQualitySCCell: UICollectionViewCell {
    
    func configureWithModel(_ model: AirQualityModel?) {
        guard let modelInternal = model else {
            return
        }
        
        pollutionMaterialName.text = modelInternal.pollutionName
        pollutionMaterialProfessionName.text = modelInternal.pollutionMaterialProfessionName
        pollutionNumber.text = modelInternal.pollutionNumber
        pollutionUnit.text = modelInternal.pollutionUnit
        percentageNumber.text = modelInternal.percentageNumber
        normalStandardNumber.text = modelInternal.normalStandardNumber
        normalHolderLabel.text = "BEST"
//        percentageNumber.theme_textColor = modelInternal.percentageNumberColor
        
        lineS.isHidden = false
        lineF.isHidden = false
    }
    
    // Circle BG
    lazy var circleBackgroundView: UIView = {
        let circleBackgroundViewInternal = UIView()
        circleBackgroundViewInternal.theme_backgroundColor = AirKnowConfig.homePageAirQualityStatusSectionControllerCellBGStyles
        circleBackgroundViewInternal.layer.cornerRadius = 2
        return circleBackgroundViewInternal
    }()
    
    // Pollution Material Name
    lazy var pollutionMaterialName : UILabel = {
        let pollutionMaterialNameInternal = UILabel()
        pollutionMaterialNameInternal.adjustsFontSizeToFitWidth = true
        pollutionMaterialNameInternal.theme_textColor = AirKnowConfig.homePageAirQualitySectionControllerCellPMNStyles
        pollutionMaterialNameInternal.textAlignment = NSTextAlignment.left
        pollutionMaterialNameInternal.font = AirKnowConfig.homePageAirQualitySectionControllerCelPMNFont
        pollutionMaterialNameInternal.layer.cornerRadius = 2
        return pollutionMaterialNameInternal
    }()
    
    // Pollution Material Profession Name
    lazy var pollutionMaterialProfessionName: UILabel = {
        let pollutionMaterialProfessionNameInternal = UILabel()
        pollutionMaterialProfessionNameInternal.textAlignment = NSTextAlignment.left
        pollutionMaterialProfessionNameInternal.font = AirKnowConfig.homePageAirQualitySectionControllerCelPMPNFont
        pollutionMaterialProfessionNameInternal.layer.cornerRadius = 2
        pollutionMaterialProfessionNameInternal.theme_textColor = AirKnowConfig.homePageAirQualitySectionControllerCellPMPNStyles
        return pollutionMaterialProfessionNameInternal
    }()
    
    // Pollution Material Pollution Number
    lazy var pollutionNumber: UILabel = {
        let pollutionNumberInternal = UILabel()
        pollutionNumberInternal.adjustsFontSizeToFitWidth = true
        pollutionNumberInternal.theme_textColor = AirKnowConfig.homePageAirQualitySectionControllerCellPNStyles
        pollutionNumberInternal.font = AirKnowConfig.homePageAirQualitySectionControllerCelPNFont
        pollutionNumberInternal.textAlignment = NSTextAlignment.right
        pollutionNumberInternal.layer.cornerRadius = 2
        return pollutionNumberInternal
    }()
    
    // Pollution Material Pollution Unit
    lazy var pollutionUnit: UILabel = {
        let pollutionUnitInternal = UILabel()
        pollutionUnitInternal.adjustsFontSizeToFitWidth = true
        pollutionUnitInternal.theme_textColor = AirKnowConfig.homePageAirQualitySectionControllerCellPUStyles
        pollutionUnitInternal.font = AirKnowConfig.homePageAirQualitySectionControllerCelPUFont
        pollutionUnitInternal.textAlignment = NSTextAlignment.left
        pollutionUnitInternal.layer.cornerRadius = 2
        return pollutionUnitInternal
    }()
    
    // Two Separated Line
    lazy var lineF: UIView = {
        let lineFInternal = UIView()
        lineFInternal.isHidden = true
        lineFInternal.theme_backgroundColor = AirKnowConfig.homePageAirQualitySectionControllerCellLineStyles
        return lineFInternal
    }()
    lazy var lineS: UIView = {
        let lineSInternal = UIView()
        lineSInternal.isHidden = true
        lineSInternal.theme_backgroundColor = AirKnowConfig.homePageAirQualitySectionControllerCellLineStyles
        return lineSInternal
    }()
    
    // Percent Number Label
    lazy var percentageNumber: UILabel = {
        let percentageNumberInternal = UILabel()
        percentageNumberInternal.adjustsFontSizeToFitWidth = true
        percentageNumberInternal.theme_textColor = AirKnowConfig.homePageAirQualitySectionControllerCellPercentNumberStyles
        percentageNumberInternal.textAlignment = NSTextAlignment.center
        percentageNumberInternal.font = AirKnowConfig.homePageAirQualitySectionControllerCelPercentNumberFont
        percentageNumberInternal.layer.cornerRadius = 2
        return percentageNumberInternal
    }()
    
    // Normal Standard Number
    lazy var normalStandardNumber: UILabel = {
        let normalStandardNumberInternal = UILabel()
        normalStandardNumberInternal.adjustsFontSizeToFitWidth = true
        normalStandardNumberInternal.font = AirKnowConfig.homePageAirQualitySectionControllerCelNSNFont
        normalStandardNumberInternal.textAlignment = NSTextAlignment.left
        normalStandardNumberInternal.theme_textColor = AirKnowConfig.homePageAirQualitySectionControllerCellNormalStandardStyles
        return normalStandardNumberInternal
    }()
    
    // "NORMAL" Holder Label
    lazy var normalHolderLabel: UILabel = {
        let normalHolderLabelINternal = UILabel()
        normalHolderLabelINternal.adjustsFontSizeToFitWidth = true
        normalHolderLabelINternal.textAlignment = NSTextAlignment.left
        normalHolderLabelINternal.font = UIFont.systemFont(ofSize: 8.0)
        normalHolderLabelINternal.theme_textColor = AirKnowConfig.homePageAirQualitySectionControllerCellNormalHolderStyles
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
                make.width.equalTo(AirKnowConfig.homePageAirQualitySectionControllerCelLineWidth)
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
