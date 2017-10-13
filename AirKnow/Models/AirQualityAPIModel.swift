//
//  AirQualityAPIModel.swift
//  AirKnow
//
//  Created by wj on 2017/9/26.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit
import HandyJSON

class AirQualityAPIModel: HandyJSON {

    var aqi: Int = 0
    var time: TimeInterval = 0
    var uhour: String = ""
    var utime: String = ""
    var utimecn: String = ""
    var utimejp: String = ""
    var info: String = ""
    var infocn: String = ""
    var infojp: String = ""
    var historic: Array<Any> = []
    var ctemp: Int?
    var cpres: Int?
    var nameen: String = ""
    var namena: String = ""
    var cwind: Array<Int> = []
    var wgt: String = ""
    var ids: Dictionary<String, Any> = [:]
    var wf: String = ""
    var nearest: Array<AirQualityNearestAPIModel> = []
    
    required init() {}
    
}

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
