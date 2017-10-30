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
    
    func addNewLocation(searchResultModel rm: AirQualitySearchResultModel) {
        NotificationCenter.default.post(name: NSNotification.Name("HomePageShowHUD"), object: self, userInfo: nil)

        var currenCityModels = self.getAllCityModels()
        
        for (index, item)  in currenCityModels!.enumerated() {
            if let nearest = item.nearest, let nearestF: AirQualityNearestAPIModel = nearest.first, let curMId = nearestF.locationId, let rmId = rm.uid {
                if rmId == curMId {
                    NotificationCenter.default.post(name: NSNotification.Name("HomePageHideHUD"), object: self, userInfo: ["Er": index])
                    return
                }
            }
        }

        if let rmUid = rm.uid {
            AQIInfoService.goGet(rmUid, completetion: { (apiModel, error) in
                if apiModel != nil {
                    currenCityModels!.append(apiModel!)
                    self.saveAllCityModels(currenCityModels!)
                }
                DispatchQueue.main.async(execute: {
                    let erContent = error != nil ? error?.description : ""
                    NotificationCenter.default.post(name: NSNotification.Name("HomePageHideHUD"), object: self, userInfo: ["Er": erContent!])
                })
            })
        } else {
            NotificationCenter.default.post(name: NSNotification.Name("HomePageHideHUD"), object: self, userInfo: ["Er": "no valid uid"])
        }
    }
    
    func removeALocatona(at index: Int) {
        var currenCityModels = self.getAllCityModels()
        currenCityModels?.remove(at: index)
        self.saveAllCityModels(currenCityModels!)
    }
    
    func currentMonitorLocationNumber() -> Int  {
        if let mdoels = self.getAllCityModels() {
            return mdoels.count
        } else {
            return 0
        }
    }
    
    func getAllCityModels() -> [AirQualityAPIModel]? {
        if cityModels != nil && cityModels?.count != 0 {
           return cityModels!
        }
        
        cityModels = Array<AirQualityAPIModel>()
        if let jsonStirngArray: Array = try? storage.object(ofType: Array<String>.self, forKey: cityModelsKey) {
            for jsonStirng in jsonStirngArray {
                if let model: AirQualityAPIModel = AirQualityAPIModel.deserialize(from: jsonStirng) {
                    model.jsonString = jsonStirng
                    cityModels!.append(model)
                }
            }
            return cityModels
        }
        
        return []
    }
    
    func saveAllCityModels(_ airQualityAPIModels: Array<AirQualityAPIModel>) {
        cityModels = airQualityAPIModels
        
        var jsonStringArray = Array<String>()
        for model in airQualityAPIModels {
            if let jsonS = model.jsonString {
                jsonStringArray.append(jsonS)
            }
        }
        
        try? storage.removeObject(forKey: cityModelsKey)
        try? storage.setObject(jsonStringArray, forKey: cityModelsKey)
    }
}
