//
//  AirQualityNearestAPIModel.swift
//  AirKnow
//
//  Created by cbang on 2017/10/17.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit
import HandyJSON

class AirQualityNearestAPIModel: HandyJSON {
    
    var pollutionName: String = ""
    var locationEnglishName: String = ""
    var locationChineseName: String = ""
    var key: String = ""
    var currenTime: TimeInterval = 0
    var pollutionValue: String = ""
    var urban: String = ""
    var ginwave: Array<Int> = []
    var locationId: Int = 0
    
    func mapping(mapper: HelpingMapper) {
        mapper <<< self.pollutionName <-- "pol"
        mapper <<< self.locationEnglishName <-- "nlo"
        mapper <<< self.locationChineseName <-- "nna"
        mapper <<< self.key <-- "key"
        mapper <<< self.currenTime <-- "t"
        mapper <<< self.pollutionValue <-- "v"
        mapper <<< self.urban <-- "u"
        mapper <<< self.ginwave <-- "g"
        mapper <<< self.locationId <-- "x"
    }
    
    required init() {}
}
