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
import Spring

class AirQualityStatusView: UIView {
    
    lazy var titleButton: UIButton = {
        let titleButtonInternal: UIButton = UIButton()
        titleButtonInternal.titleLabel?.font = AirKnowConfig.airKnowAQSTitleButtonFont
        titleButtonInternal.theme_setTitleColor(AirKnowConfig.airKnowAQSGoodStyles, forState: .normal)
        titleButtonInternal.addTarget(self, action: #selector(switchTitleButton(sender:)), for: .touchUpInside)
        titleButtonInternal.layer.cornerRadius = 2
        return titleButtonInternal
    }()
    
    lazy var progressView: UIView = {
        let progressViewInternal: UIView = UIView()
        progressViewInternal.backgroundColor = UIColor.clear
        return progressViewInternal
    }()
    
    lazy var triangleIndicatorImageView: UIImageView = {
        let triangleIndicatorImageViewInternal: UIImageView = UIImageView()
        triangleIndicatorImageViewInternal.isHidden = true
        triangleIndicatorImageViewInternal.theme_image = AirKnowConfig.airKnowAQSTriangleIndicatorImageStyles
        triangleIndicatorImageViewInternal.backgroundColor = UIColor.clear
        return triangleIndicatorImageViewInternal
    }()
    
    lazy var descriptionLabel: UILabel = {
        let descriptionLabelInternal: UILabel = UILabel()
        descriptionLabelInternal.textAlignment = NSTextAlignment.center
        descriptionLabelInternal.backgroundColor = UIColor.clear
        descriptionLabelInternal.font = AirKnowConfig.airKnowAQSDescriptionLabelFont
        descriptionLabelInternal.theme_textColor = AirKnowConfig.airKnowAQSDescriptionLabelStyles
        return descriptionLabelInternal
    }()
    
    fileprivate var triangleIndicatorFrameX: CGFloat = 0
    fileprivate var progressHighSectionView: UIView?
    fileprivate var targetModel: AirQualityStatusModel?
    
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
            addSubview(triangleIndicatorImageView)
            addSubview(progressView)
            addSubview(descriptionLabel)
            
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
                    make.left.equalTo(progressView.snp.left).offset(triangleIndicatorFrameX)
                    make.width.equalTo(AirKnowConfig.airKnowAQSTriangleIndicatorWidth)
                    make.height.equalTo(AirKnowConfig.airKnowAQSTriangleIndicatorHeight)
                }
            }
            layoutTriangleIndicatorView()
            
            func layoutProgressView() {
                progressView.snp.makeConstraints { (make) in
                    make.top.equalTo(triangleIndicatorImageView.snp.bottom).offset(AirKnowConfig.airKnowAQSProgressTopPadding)
                    make.centerX.equalTo(self.snp.centerX)
                    make.height.equalTo(AirKnowConfig.airKnowAQSProgressHeight)
                    make.width.equalTo((AirKnowConfig.airKnowAQSProgressSectionWidth + AirKnowConfig.airKnowAQSProgressLineWidth) * CGFloat(AirKnowConfig.airKonwAQSLevelCount))
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
        
        configureSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if targetModel != nil {
            refreshUI()
        }
    }
    
    fileprivate func setupStatusData(data: AirQualityStatusModel) {
        
        if data.AQI != 0 {
            titleButton.setTitle(String(data.AQI), for: .normal)
        }
        
        triangleIndicatorImageView.isHidden = false
        titleButton.tag = 1
        descriptionLabel.text = data.warmLog
        
        targetModel = data
    }
    
    fileprivate func refreshUI() {
        triangleIndicatorImageView.snp.updateConstraints { (make) in
            make.left.equalTo(progressView.snp.left).offset(CGFloat(targetModel!.level.rawValue) * (AirKnowConfig.airKnowAQSProgressSectionWidth + AirKnowConfig.airKnowAQSProgressLineWidth))
        }
        
        let statusLevelThemeColor: ThemeColorPicker = returnAirQualityStatusThemeColor(level: targetModel!.level)
        titleButton.theme_setTitleColor(statusLevelThemeColor, forState: .normal)
        
        drawProgressView()
        drawProgressHighSectionView(statusColor: statusLevelThemeColor)
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
        guard let statusDataInternal = statusData else {
            return
        }

        if sender.tag == 1 {
            titleButton.tag = 2
            
            if statusDataInternal.status == nil || statusDataInternal.status == "" {
                return
            }
            
            titleButton.setTitle(statusDataInternal.status, for: .normal)
        } else {
            titleButton.tag = 1
            
            if statusDataInternal.AQI != 0 {
                titleButton.setTitle(String(statusDataInternal.AQI), for: .normal)
            }
        }
    }
}

// MARK: - Draw Progress View
extension AirQualityStatusView {
    
    fileprivate func drawProgressView() {
        func drawProgressBackgroundView() {
            progressView.layer.sublayers?.forEach({ (subLyaer) in
                subLyaer.removeFromSuperlayer()
            })
            
            let backgroundLayer: CALayer = CALayer()
            backgroundLayer.theme_backgroundColor = AirKnowConfig.airKnowAQSProgressBackgroundStyles
            backgroundLayer.frame = progressView.bounds
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
        if (progressHighSectionView != nil) {
            progressHighSectionView?.removeFromSuperview()
        }
        
        triangleIndicatorFrameX = progressView.x + CGFloat(targetModel!.level.rawValue) * (AirKnowConfig.airKnowAQSProgressSectionWidth + AirKnowConfig.airKnowAQSProgressLineWidth)
        let highSectionViewFrameX: CGFloat = triangleIndicatorFrameX - AirKnowConfig.airKnowAQSProgressLineWidth - progressView.x
        let highSectionViewWidth: CGFloat = AirKnowConfig.airKnowAQSProgressSectionWidth + AirKnowConfig.airKnowAQSProgressLineWidth * 2
        var highSectionFrame = progressView.bounds
        highSectionFrame.origin.x = highSectionViewFrameX
        highSectionFrame.size.width = highSectionViewWidth
        let highSectionView: UIView = UIView(frame: highSectionFrame)
        
        highSectionView.theme_backgroundColor = statusColor
        progressView.addSubview(highSectionView)
        progressHighSectionView = highSectionView
    }
}
