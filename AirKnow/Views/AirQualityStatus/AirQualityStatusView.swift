//
//  AirQualityStatusView.swift
//  AirKnow
//
//  Created by wj on 2017/9/10.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit
import SnapKit
import SwiftTheme

class AirQualityStatusView: UIView {
    
    lazy var titleButton: UIButton = {
        let titleButtonInternal: UIButton = UIButton()
        titleButtonInternal.setTitle(AirKnowConfig.airKnowAQSTitleButtonDefaultNameString, for: UIControlState.normal)
        titleButtonInternal.backgroundColor = UIColor.clear
        titleButtonInternal.titleLabel?.font = AirKnowConfig.airKnowAQSTitleButtonFont
        titleButtonInternal.theme_setTitleColor(AirKnowConfig.airKnowAQSGoodStyles, forState: .normal)
        titleButtonInternal.addTarget(self, action: #selector(switchTitleButton(sender:)), for: .touchUpInside)
        return titleButtonInternal
    }()
    
    lazy var progressView: UIView = {
        let progressViewInternal: UIView = UIView()
        let progressViewInternalWidth: CGFloat = (AirKnowConfig.airKnowAQSProgressSectionWidth + AirKnowConfig.airKnowAQSProgressLineWidth) * CGFloat(AirKnowConfig.airKonwAQSLevelCount)
        let progressViewInternalFrameX: CGFloat = (UIScreen.main.bounds.width - progressViewInternalWidth) * 0.5
        progressViewInternal.frame = CGRect.init(x: progressViewInternalFrameX, y: AirKnowConfig.airKnowAQSProgressTopPadding, width: progressViewInternalWidth, height: AirKnowConfig.airKnowAQSProgressHeight)
        progressViewInternal.backgroundColor = UIColor.clear
        return progressViewInternal
    }()
    
    lazy var triangleIndicatorImageView: UIImageView = {
        let triangleIndicatorImageViewInternal: UIImageView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: AirKnowConfig.airKnowAQSTriangleIndicatorWidth, height: AirKnowConfig.airKnowAQSTriangleIndicatorHeight))
        triangleIndicatorImageViewInternal.theme_image = AirKnowConfig.airKnowAQSTriangleIndicatorImageStringStyles
        triangleIndicatorImageViewInternal.backgroundColor = UIColor.clear
        return triangleIndicatorImageViewInternal
    }()
    
    lazy var descriptionLabel: UILabel = {
        let descriptionLabelInternal: UILabel = UILabel()
        descriptionLabelInternal.textAlignment = NSTextAlignment.center
        descriptionLabelInternal.backgroundColor = UIColor.clear
        descriptionLabelInternal.text = AirKnowConfig.airKnowAQSDescriptionLabelDefaultNameString
        descriptionLabelInternal.font = AirKnowConfig.airKnowAQSDescriptionLabelFont
        descriptionLabelInternal.theme_textColor = AirKnowConfig.airKnowAQSDescriptionLabelStringStyles
        return descriptionLabelInternal
    }()
    
    fileprivate var triangleIndicatorFrameX: CGFloat = 0.5 * UIScreen.main.bounds.width
    
    // data
    var statusData: AirQualityStatusModel? {
        didSet {
            guard let data = statusData else {
                return
            }
            setupStatusData(data: data)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        func configureSubviews() {
            addSubview(titleButton)
            addSubview(progressView)
            addSubview(triangleIndicatorImageView)
            addSubview(descriptionLabel)
        }
        
        configureSubviews()
        drawProgressView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        func layoutTitleButtonView() {
            titleButton.snp.makeConstraints { (make) in
                make.top.equalTo(self.snp.top).offset(AirKnowConfig.airKnowAQSTitleButtonTopPadding)
                make.height.equalTo(AirKnowConfig.airKnowAQSTitleButtonHeight)
                make.left.equalTo(self.snp.left).offset(AirKnowConfig.airKnowAQSTitleButtonLeftPadding)
                make.right.equalTo(self.snp.right).offset(AirKnowConfig.airKnowAQSTitleButtonRightPadding)
            }
        }
        layoutTitleButtonView()
        
        func layoutTriangleIndicatorView() {
            triangleIndicatorImageView.snp.makeConstraints { (make) in
                make.top.equalTo(titleButton.snp.bottom).offset(AirKnowConfig.airKnowAQSTriangleIndicatorTopPadding)
                make.left.equalTo(self.snp.left).offset(triangleIndicatorFrameX)
                make.width.equalTo(AirKnowConfig.airKnowAQSTriangleIndicatorWidth)
                make.height.equalTo(AirKnowConfig.airKnowAQSTriangleIndicatorHeight)
            }
        }
        layoutTriangleIndicatorView()
        
        func layoutProgressView() {
            progressView.snp.makeConstraints { (make) in
                make.top.equalTo(triangleIndicatorImageView.snp.bottom).offset(AirKnowConfig.airKnowAQSProgressTopPadding)
                
            }
        }
        layoutProgressView()
        
        func layoutDescriptionLabel() {
            descriptionLabel.snp.makeConstraints { (make) in
                make.top.equalTo(progressView.snp.bottom).offset(AirKnowConfig.airKnowAQSDescriptionLabelTopPadding)
                make.left.equalTo(self.snp.left).offset(AirKnowConfig.airKnowAQSDescriptionLabelLeftPadding)
                make.right.equalTo(self.snp.right).offset(AirKnowConfig.airKnowAQSDescriptionLabelRightPadding)
                make.bottom.equalTo(self.snp.bottom).offset(AirKnowConfig.airKnowAQSDescriptionLabelBottomPadding)
                make.height.equalTo(AirKnowConfig.airKnowAQSDescriptionLabelHeight)
            }
        }
        layoutDescriptionLabel()
    }
    
    fileprivate func setupStatusData(data: AirQualityStatusModel) {
        
        titleButton.setTitle(String(data.AQI), for: .normal)
        titleButton.tag = 1
        descriptionLabel.text = data.warmLog
        
        func refreshUI() {
            triangleIndicatorFrameX = progressView.x + CGFloat(data.level.rawValue) * (AirKnowConfig.airKnowAQSProgressSectionWidth + AirKnowConfig.airKnowAQSProgressLineWidth)
            var frame = triangleIndicatorImageView.frame
            frame.origin.x = triangleIndicatorFrameX
            triangleIndicatorImageView.frame = frame
            
            let statusLevelThemeColor: ThemeColorPicker = returnAirQualityStatusThemeColor(level: data.level)
            titleButton.theme_setTitleColor(statusLevelThemeColor, forState: .normal)
            
            drawProgressHighSectionView(statusColor: statusLevelThemeColor)
        }
        refreshUI()
    }
    
    // Return AirQulityStatus Level Theme Color
    fileprivate func returnAirQualityStatusThemeColor(level: AirQualityStatusLevel) -> ThemeColorPicker {
        switch level {
        case .airKnowAirQualityStatusGood:
            return AirKnowConfig.airKnowAQSGoodStyles
            
        case .airKnowAirQualityStatusModerate:
            return AirKnowConfig.airKnowAQSModerateStyles
            
        case .airKnowAirQualityStatusUnhealthyForSensitiveGroups:
            return AirKnowConfig.airKnowAQSUnhealthyForSensitiveGroupsStyles
            
        case .airKnowAirQualityStatusUnhealthy:
            return AirKnowConfig.airKnowAQSUnhealthyStyles
            
        case .airKnowAirQualityStatusVeryUnhealthy:
            return AirKnowConfig.airKnowAQSVeryUnhealthyStyles
            
        case .airKnowAirQualityStatusHazardous:
            return AirKnowConfig.airKnowAQSHazardousStyles
        }
    }
    
    // Switch Title Button
    @objc fileprivate func switchTitleButton(sender: UIButton) {
        if sender.tag == 1 {
            titleButton.tag = 2
            titleButton.setTitle(statusData?.status, for: .normal)
        } else {
            titleButton.tag = 1
            titleButton.setTitle(String(statusData!.AQI), for: .normal)
        }
    }
}

// MARK: - Draw Progress View
extension AirQualityStatusView {
    
    fileprivate func drawProgressView() {
        
        func drawProgressBackgroundView() {
            let backgroundLayer: CALayer = CALayer()
            backgroundLayer.theme_backgroundColor = AirKnowConfig.airKnowAQSProgressBackgroundStyles
            backgroundLayer.frame = progressView.frame
            backgroundLayer.cornerRadius = 1.0
            backgroundLayer.masksToBounds = true
            progressView.layer.addSublayer(backgroundLayer)
            
            func drawProgressLineView() {
                for i in 1..<AirKnowConfig.airKonwAQSLevelCount {
                    let lineLayer: CALayer = CALayer()
                    lineLayer.theme_backgroundColor = AirKnowConfig.airKnowAQSProgressLineStyles
                    let linelayerFrameX: CGFloat = (AirKnowConfig.airKnowAQSProgressSectionWidth + AirKnowConfig.airKnowAQSProgressLineWidth) * CGFloat(i) - AirKnowConfig.airKnowAQSProgressLineWidth
                    lineLayer.frame = CGRect.init(x: linelayerFrameX, y: 0, width: AirKnowConfig.airKnowAQSProgressLineWidth, height: AirKnowConfig.airKnowAQSProgressHeight)
                    backgroundLayer.addSublayer(lineLayer)
                }
            }
            drawProgressLineView()
        }
        drawProgressBackgroundView()
    }
    
    fileprivate func drawProgressHighSectionView(statusColor: ThemeColorPicker) {
//        let highSectionLayer: CALayer = CALayer()
//        highSectionLayer.theme_backgroundColor = statusColor
//        highSectionLayer.frame =
        let highSectionViewFrameX: CGFloat = triangleIndicatorFrameX - AirKnowConfig.airKnowAQSProgressLineWidth
        let highSectionViewWidth: CGFloat = AirKnowConfig.airKnowAQSProgressSectionWidth + AirKnowConfig.airKnowAQSProgressLineWidth * 2
        var highSectionFrame = progressView.frame
        highSectionFrame.origin.x = highSectionViewFrameX
        highSectionFrame.size.width = highSectionViewWidth
        let highSectionView: UIView = UIView(frame: highSectionFrame)
        
        highSectionView.theme_backgroundColor = statusColor
        progressView.addSubview(highSectionView)
    }
}
