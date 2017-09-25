//
//  AirQualityModel.swift
//  AirKnow
//
//  Created by 陈超邦 on 2017/9/15.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit
import IGListKit

class AirQualityModel: NSObject, ListDiffable {
    
    var pollutionName: String?
    var pollutionMaterialProfessionName: String?
    var pollutionNumber: String?
    var pollutionUnit: String?
    var percentageNumber: String?
    var normalStandardNumber: String?
    
    init(pollutionName: String, pollutionMaterialProfessionName: String, pollutionNumber: String, pollutionUnit: String, percentageNumber: String, normalStandardNumber: String) {
        self.pollutionName = pollutionName
        self.pollutionMaterialProfessionName = pollutionMaterialProfessionName
        self.pollutionNumber = pollutionNumber
        self.pollutionUnit = pollutionUnit
        self.percentageNumber = percentageNumber
        self.normalStandardNumber = normalStandardNumber
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
