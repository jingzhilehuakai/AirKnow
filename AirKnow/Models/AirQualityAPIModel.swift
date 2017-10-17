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
    
    var aqi: Int?
    var time: TimeInterval?
    var uhour: String?
    var utime: String?
    var utimecn: String?
    var utimejp: String?
    var info: String?
    var infocn: String?
    var infojp: String?
    var historic: Array<Any>?
    var ctemp: Int?
    var cpres: Int?
    var nameen: String?
    var namena: String?
    var cwind: Array<Int>?
    var wgt: String?
    var ids: Dictionary<String, Any>?
    var wf: String?
    var nearest: Array<AirQualityNearestAPIModel>?
    var jsonString: String?
    
    required init() {}
}
