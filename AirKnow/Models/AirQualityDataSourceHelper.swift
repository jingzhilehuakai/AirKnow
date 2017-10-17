//
//  AirQualityDataSourceHelper.swift
//  AirKnow
//
//  Created by wj on 2017/9/26.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit

class AirQualityDataSourceHelper: NSObject {

//    func creatAirQualityStatusModel(data: AirQualityAPIModel) -> AirQualityStatusModel? {
//        let statusModelInternal: AirQualityStatusModel = AirQualityStatusModel.init(AQI: aqi, level: 0, status: , warmLog: <#T##String#>)
//        
//        return statusModelInternal
//    }
    
    lazy var pollutionInfo: [String: Any] =  {
        var pollutionInfoDic = [String: Any]()
        let pm25Data = (name: "PM2.5", unit: "11", normalValue: 30, preferenceName: "Particular Matter")
        pollutionInfoDic["PM2.5"] = pm25Data
        return pollutionInfoDic
    }()
}
