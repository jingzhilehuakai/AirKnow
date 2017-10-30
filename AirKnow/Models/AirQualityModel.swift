//
//  AirQualityModel.swift
//  AirKnow
//
//  Created by 陈超邦 on 2017/9/15.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit
import IGListKit
import SwiftTheme

class AirQualityModel: NSObject, ListDiffable {
    
    var key: String?
    var pollutionName: String?
    var pollutionMaterialProfessionName: String?
    var pollutionNumber: String?
    var pollutionUnit: String?
    var percentageNumber: String?
    var normalStandardNumber: String?
    var percentageNumberColor: ThemeColorPicker?
    
    override init() {
        super.init()
    }
    
    // ListDiffable Protocol
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object { return true }
        guard (object as? AirQualityModel) != nil else { return false }
        return false
    }
}
