//
//  AirConditionStatusModel.swift
//  AirKnow
//
//  Created by 陈超邦 on 2017/9/9.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit
import IGListKit
import SwiftTheme

class AirQualityStatusModel: NSObject, ListDiffable {
    
    enum AirQualityStatus: Int {
        case Good = 0
        case Moderate  = 1
        case UnhealthyForSensitiveGroups  = 2
        case Unhealthy  = 3
        case VeryUnhealthy  = 4
        case Hazardous  = 5
    }
    
    var AQI: Int = 0
    var level: AirQualityStatus!
    var status: String!
    var warmLog: String!
    var statusTheme: ThemeColorPicker!
    
    func warmLogWithAQI(_ number: Int) -> String? {
        if number >= 0 && number <= 50 {
            return "AIR SMELL FRESH, WHY NOT HAVE A WALK?"
        } else if number > 50 && number <= 100 {
            return "AIR SMELL ... OK, WEAR A MASK OBLY IF YOU ARE SENSITIVE"
        } else if number > 100 && number <= 150 {
            return "WEAR A MASK AND DRINK MORE WATER"
        } else if number > 150 && number <= 200 {
            return "STAY HOME IF YOU FELL NOT WELL"
        } else if number > 200 && number <= 300 {
            return "WARNING, TRY STAYING INDOOR"
        } else if number > 300 {
            return "GOT NOTHING TO SAY, I'AM GONNA HIDE"
        } else {
            return nil
        }
    }
    
    func statusStringWithAQI(_ number: Int) -> String? {
        if number >= 0 && number <= 50 {
            return "GOOD"
        } else if number > 50 && number <= 100 {
            return "Moderate"
        } else if number > 100 && number <= 150 {
            return "Sensitive"
        } else if number > 150 && number <= 200 {
            return "Unhealthy"
        } else if number > 200 && number <= 300 {
            return "VeryUnhealthy"
        } else if number > 300 {
            return "Hazardous"
        } else {
            return nil
        }
    }
    
    func levelWithAQI(_ number: Int) -> AirQualityStatus {
        if number >= 0 && number <= 50 {
            return AirQualityStatus.Good
        } else if number > 50 && number <= 100 {
            return AirQualityStatus.Moderate
        } else if number > 100 && number <= 150 {
            return AirQualityStatus.UnhealthyForSensitiveGroups
        } else if number > 150 && number <= 200 {
            return AirQualityStatus.Unhealthy
        } else if number > 200 && number <= 300 {
            return AirQualityStatus.VeryUnhealthy
        } else if number > 300 {
            return AirQualityStatus.Hazardous
        } else {
            return AirQualityStatus.Good
        }
    }
    
    func statusThemeColor(_ level: AirQualityStatus) -> ThemeColorPicker {
        switch level {
        case .Good:
            return AirKnowConfig.airKnowAQSGoodStyles
            
        case .Moderate:
            return AirKnowConfig.airKnowAQSModerateStyles
            
        case .UnhealthyForSensitiveGroups:
            return AirKnowConfig.airKnowAQSUnhealthyForSensitiveGroupsStyles
            
        case .Unhealthy:
            return AirKnowConfig.airKnowAQSUnhealthyStyles
            
        case .VeryUnhealthy:
            return AirKnowConfig.airKnowAQSVeryUnhealthyStyles
            
        case .Hazardous:
            return AirKnowConfig.airKnowAQSHazardousStyles
        }
    }

    init(AQI: Int) {
        super.init()
        self.AQI = AQI
        self.level = self.levelWithAQI(AQI)
        self.status = self.statusStringWithAQI(AQI)
        self.warmLog = self.warmLogWithAQI(AQI)
        self.statusTheme = self.statusThemeColor(self.level)
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
