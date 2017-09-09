//
//  AirConditionStatusModel.swift
//  AirKnow
//
//  Created by 陈超邦 on 2017/9/9.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit
import IGListKit

class AirConditionStatusModel: NSObject, ListDiffable {
    
    var AQI: Int = 0
    let status: String?
    let warmLog: String?
    
    init(AQI: Int, status: String, warmLog: String) {
        self.AQI = AQI
        self.status = status
        self.warmLog = warmLog
    }

    // ListDiffable Protocol
    func diffIdentifier() -> NSObjectProtocol {
        return AQI as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object { return true }
        guard (object as? AirConditionStatusModel) != nil else { return false }
        return false
    }
}
