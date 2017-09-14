
//
//  CityBackgroundView.swift
//  AirKnow
//
//  Created by 陈超邦 on 2017/9/9.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit
import SnapKit

class MonitorLocationView: UIView {

    lazy var locationName: UILabel = {
        let locationNameInternal = UILabel()
        locationNameInternal.textAlignment = NSTextAlignment.center
        locationNameInternal.backgroundColor = UIColor.clear
        locationNameInternal.font = AirKnowConfig.MLLocationNameFont
        locationNameInternal.layer.cornerRadius = 2
        locationNameInternal.theme_textColor = AirKnowConfig.MLLocationNameStringStyles
        return locationNameInternal
    }()
    
    lazy var updateTime: UILabel = {
        let updateTimeInternal = UILabel()
        updateTimeInternal.textAlignment = NSTextAlignment.center
        updateTimeInternal.backgroundColor = UIColor.clear
        updateTimeInternal.numberOfLines = 2
        updateTimeInternal.layer.cornerRadius = 2
        updateTimeInternal.font = AirKnowConfig.MLUpdateTimeFont
        updateTimeInternal.theme_textColor = AirKnowConfig.MLUpdateTimeStringStyles
        return updateTimeInternal
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        func layoutlocationName() {
            self.addSubview(locationName)
            locationName.snp.makeConstraints { (make) in
                make.left.equalTo(self.snp.left).offset(AirKnowConfig.MLLocationNameLeftPadding)
                make.right.equalTo(self.snp.right).offset(AirKnowConfig.MLLocationNameRightPadding)
                make.top.equalTo(self.snp.top).offset(AirKnowConfig.MLLocationNameTopPadding)
                make.height.greaterThanOrEqualTo(30)
            }
        }
        layoutlocationName()
        
        func layoutUpdateTime() {
            self.addSubview(updateTime)
            updateTime.snp.makeConstraints { (make) in
                make.top.equalTo(locationName.snp.bottom).offset(AirKnowConfig.MLUpdateTimeTopPadding)
                make.centerX.equalTo(locationName.snp.centerX)
                make.width.equalTo(AirKnowConfig.MLUpdateTimeWidth)
                make.height.greaterThanOrEqualTo(20)
            }
        }
        layoutUpdateTime()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Alpha
    func setAlpppha(_ alpha: CGFloat) {
        locationName.alpha = alpha
        updateTime.alpha = alpha
    }
}
