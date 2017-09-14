//
//  AirMonitorLocationModel.swift
//  AirKnow
//
//  Created by 陈超邦 on 2017/9/15.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit
import IGListKit

class AirMonitorLocationModel: NSObject, ListDiffable {
    
    var location: String?
    var updateTime: String?
    
    init(location: String, updateTime: String) {
        self.location = location
        self.updateTime = updateTime
    }
    
    // ListDiffable Protocol
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object { return true }
        guard (object as? AirMonitorLocationModel) != nil else { return false }
        return false
    }
}
