
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
        let locationNameInternal: UILabel = UILabel()
        locationNameInternal.textAlignment = NSTextAlignment.center
        locationNameInternal.backgroundColor = UIColor.clear
        locationNameInternal.text = AirKnowConfig.airKnowMLLocationNameDefaultNameString
        locationNameInternal.font = AirKnowConfig.airKnowMLLocationNameFont
        locationNameInternal.theme_textColor = AirKnowConfig.airKnowGlobalMLLocationNameStringStyles
        return locationNameInternal
    }()
    
    lazy var updateTime: UILabel = {
        let updateTimeInternal = UILabel()
        updateTimeInternal.text = AirKnowConfig.airKnowMLUpdateTimeDefaultNameString
        updateTimeInternal.textAlignment = NSTextAlignment.center
        updateTimeInternal.backgroundColor = UIColor.clear
        updateTimeInternal.numberOfLines = 2
        updateTimeInternal.font = AirKnowConfig.airKnowMLUpdateTimeFont
        updateTimeInternal.theme_textColor = AirKnowConfig.airKnowGlobalMLUpdateTimeStringStyles
        return updateTimeInternal
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()

        func layoutlocationName() {
            self.addSubview(locationName)
            locationName.snp.makeConstraints { (make) in
                make.left.equalTo(self.snp.left).offset(AirKnowConfig.airKnowMLLocationNameLeftPadding)
                make.right.equalTo(self.snp.right).offset(AirKnowConfig.airKnowMLLocationNameRightPadding)
                make.top.equalTo(self.snp.top).offset(AirKnowConfig.airKnowMLLocationNameTopPadding)
            }
        }
        layoutlocationName()
        
        func layoutUpdateTime() {
            self.addSubview(updateTime)
            updateTime.snp.makeConstraints { (make) in
                make.top.equalTo(locationName.snp.bottom).offset(AirKnowConfig.airKnowMLUpdateTimeTopPadding)
                make.centerX.equalTo(locationName.snp.centerX)
                make.width.equalTo(AirKnowConfig.airKnowMLUpdateTimeWidth)
            }
        }
        layoutUpdateTime()
    }
}
