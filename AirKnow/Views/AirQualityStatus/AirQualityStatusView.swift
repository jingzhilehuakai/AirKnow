//
//  AirQualityStatusView.swift
//  AirKnow
//
//  Created by wj on 2017/9/10.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit
import SnapKit

enum AirQualityStatusType: Int {
    case airKnowAirQualityStatusGood = 0
    case airKnowAirQualityStatusModerate  = 1
    case airKnowAirQualityStatusUnhealthyForSensitiveGroups  = 2
    case airKnowAirQualityStatusUnhealthy  = 3
    case airKnowAirQualityStatusVeryUnhealthy  = 4
    case airKnowAirQualityStatusHazardous  = 5
}

class AirQualityStatusView: UIView {
    
    lazy var titleButton: UIButton = {
        let titleButtonInternal: UIButton = UIButton()
        titleButtonInternal.setTitle(AirKnowConfig.airKnowAQSTitleButtonDefaultNameString, for: UIControlState.normal)
        titleButtonInternal.backgroundColor = UIColor.clear
        titleButtonInternal.titleLabel?.font = AirKnowConfig.airKnowAQSTitleButtonFont
        titleButtonInternal.theme_setTitleColor(AirKnowConfig.airKnowAQSGoodStyles, forState: .normal)
        return titleButtonInternal
    }()
    
    lazy var progressView: UIView = {
        let progressViewInternal: UIView = UIView()
        let progressViewInternalWidth: CGFloat = (AirKnowConfig.airKnowAQSProgressSectionWidth + AirKnowConfig.airKnowAQSProgressLineWidth) * CGFloat(AirKnowConfig.airKonwAQSTypeCount)
        let progressViewInternalFrameX: CGFloat = (UIScreen.main.bounds.width - progressViewInternalWidth) * 0.5
        progressViewInternal.frame = CGRect.init(x: progressViewInternalFrameX, y: AirKnowConfig.airKnowAQSProgressTopPadding, width: progressViewInternalWidth, height: AirKnowConfig.airKnowAQSProgressHeight)
        progressViewInternal.backgroundColor = UIColor.clear
        return progressViewInternal
    }()
    
    lazy var triangleIndicatorImageView: UIImageView = {
        let triangleIndicatorImageViewInternal: UIImageView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: AirKnowConfig.airKnowAQSTriangleIndicatorWidth, height: AirKnowConfig.airKnowAQSTriangleIndicatorHeight))
        triangleIndicatorImageViewInternal.image = UIImage(named:"triangleIndicator")
        triangleIndicatorImageViewInternal.backgroundColor = UIColor.clear
        return triangleIndicatorImageViewInternal
    }()
    
    lazy var descriptionLabel: UILabel = {
        let descriptionLabelInternal: UILabel = UILabel()
        descriptionLabelInternal.textAlignment = NSTextAlignment.center
        descriptionLabelInternal.backgroundColor = UIColor.clear
        descriptionLabelInternal.text = AirKnowConfig.airKnowAQSDescriptionLabelDefaultNameString
        descriptionLabelInternal.font = AirKnowConfig.airKnowAQSDescriptionLabelFont
//        descriptionLabelInternal.theme_textColor = AirKnowConfig.airKnowAQSDescriptionLabelStringStyles
        return descriptionLabelInternal
    }()
    
    fileprivate var triangleIndicatorFrameX: CGFloat = 0.5 * UIScreen.main.bounds.width
    
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
                make.centerY.equalTo(self.snp.centerY)
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
                make.height.equalTo(AirKnowConfig.airKnowAQSDescriptionLabelHeight)
            }
        }
        layoutDescriptionLabel()
    }
    
}

// MARK: - Draw Progress View
extension AirQualityStatusView {
    
    fileprivate func drawProgressView() {
        
        func drawProgressBackgroundView() {
            let backgroundLayer: CALayer = CALayer()
            backgroundLayer.theme_backgroundColor = AirKnowConfig.airKnowAQSProgressBackgroundStyles
            backgroundLayer.frame = progressView.frame
            backgroundLayer.cornerRadius = 3.0
            backgroundLayer.masksToBounds = true
            progressView.layer.addSublayer(backgroundLayer)
            
            func drawProgressLineView() {
                for i in 1..<AirKnowConfig.airKonwAQSTypeCount {
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
}
