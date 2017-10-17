//
//  LocationManager.swift
//  AirKnow
//
//  Created by cbang on 2017/10/17.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit
import Cache

let cacheName = "AirKnowAPIModelsCache"
let cityModelsKey = "cityModelsKey"

class AirKnowLocationManager: NSObject {
    static let sharedInstance = AirKnowLocationManager()
    
    var cityModels: Array<AirQualityAPIModel>?
    var storage: Storage!
    
    override init() {
        super.init()
        
        let diskConfig = DiskConfig(name: cacheName)
        let memoryConfig = MemoryConfig(expiry: .never, countLimit: 10, totalCostLimit: 10)
        storage = try? Storage(diskConfig: diskConfig, memoryConfig: memoryConfig)
    }
    
    func getAllCityModels() -> [AirQualityAPIModel]? {
        if cityModels != nil && cityModels?.count != 0 {
           return cityModels!
        }
        
        cityModels = Array<AirQualityAPIModel>()
        if let jsonStirngArray: Array = try? storage.object(ofType: Array<String>.self, forKey: cityModelsKey) {
            for jsonStirng in jsonStirngArray {
                cityModels!.append(AirQualityAPIModel.deserialize(from: jsonStirng)!)
            }
            return cityModels
        }
        
        return []
    }
    
    func saveAllCityModels(_ airQualityAPIModels: Array<AirQualityAPIModel>) {
        cityModels = airQualityAPIModels
        
        var jsonStringArray = Array<String>()
        for model in airQualityAPIModels {
            jsonStringArray.append(model.jsonString!)
        }
        try? storage.setObject(jsonStringArray, forKey: cityModelsKey)
    }
}
