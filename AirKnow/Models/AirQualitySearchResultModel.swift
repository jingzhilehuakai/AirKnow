//
//  SearchResultModel.swift
//  AirKnow
//
//  Created by 王净 on 2017/10/22.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit
import HandyJSON
import IGListKit

class AirQualitySearchResultModel: HandyJSON, ListDiffable {
    
    var uid: String?
    var aqi: String?
    var station: Dictionary<String, Any>?
    var time: Dictionary<String, Any>?
    
    required init() {}
    
    func diffIdentifier() -> NSObjectProtocol {
        return self as! NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object { return true }
        guard (object as? AirQualitySearchResultModel) != nil else { return false }
        return false
    }
}
