//
//  AirConditionStatusModel.swift
//  AirKnow
//
//  Created by 陈超邦 on 2017/9/9.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit
import IGListKit

enum AirQualityStatusLevel: Int {
    case airKnowAirQualityStatusGood = 0
    case airKnowAirQualityStatusModerate  = 1
    case airKnowAirQualityStatusUnhealthyForSensitiveGroups  = 2
    case airKnowAirQualityStatusUnhealthy  = 3
    case airKnowAirQualityStatusVeryUnhealthy  = 4
    case airKnowAirQualityStatusHazardous  = 5
}

class AirQualityStatusModel: NSObject, ListDiffable {
    
    var AQI: Int = 0
    var level: AirQualityStatusLevel = .airKnowAirQualityStatusGood
    
    let status: String?
    let warmLog: String?
    
    init(AQI: Int, level: Int, status: String, warmLog: String) {
        self.AQI = AQI
        self.level = AirQualityStatusLevel(rawValue: level)!
        self.status = status
        self.warmLog = warmLog
    }

    // ListDiffable Protocol
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object { return true }
        guard (object as? AirQualityStatusModel) != nil else { return false }
        return false
    }
}
