//
//  AirQualityAPIModel.swift
//  AirKnow
//
//  Created by wj on 2017/9/26.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit
import HandyJSON
import IGListKit

class AirQualityAPIModel: HandyJSON, ListDiffable {
    
    var udid: String?
    var aqi: Int!
    var time: TimeInterval?
    var uhour: String?
    var utime: String?
    var utimecn: String?
    var utimejp: String?
    var info: String?
    var infocn: String?
    var infojp: String?
    var historic: Dictionary<String, Any>?
    var ctemp: Int?
    var cpres: Int?
    var nameen: String?
    var namena: String?
    var cwind: Array<Int>?
    var wgt: String?
    var ids: Dictionary<String, Any>?
    var wf: String?
    var nearest: Array<AirQualityNearestAPIModel>?
    var jsonString: String? {
        didSet {
            self.configSubModels()
        }
    }
    var aQStatusModel: AirQualityStatusModel!
    var aQSModelArray: Array<AirQualityModel>!
    
    func configSubModels() {
        if aqi == nil { return }
        aQStatusModel = AirQualityStatusModel.init(AQI: aqi)
        aQSModelArray = Array<AirQualityModel>()
        if let historicInternal  = historic {
            for (key, value) in historicInternal {
                var temp: Double?
                if let valueDic = value as? Dictionary<String, Double> {
                    temp = valueDic.values.first
                } else if let valueArr = value as? Array<Double> {
                    temp = valueArr.first
                } else {
                    continue
                }
                
                if let arrFirstDouble = temp {
                    let aqModel = AirQualityModel()
                    aqModel.key = key
                    if key == "PM2.5" {
                        aqModel.pollutionName = "Particular Matter";
                        aqModel.pollutionMaterialProfessionName = key
                        aqModel.pollutionUnit = "μg/m3"
                        aqModel.normalStandardNumber = "<=12\(aqModel.pollutionUnit!)"
                        aqModel.pollutionNumber = String(arrFirstDouble)
                        aqModel.percentageNumber = String(format: "%.2f", arrFirstDouble * 100 / 12) + "%"
                        aqModel.percentageNumberColor = aQStatusModel.statusThemeColor(aQStatusModel.levelWithAQI(Int(arrFirstDouble / 12 * 50)))
                        aQSModelArray?.append(aqModel)
                    } else if key == "PM10" {
                        aqModel.pollutionName = "Particular Matter";
                        aqModel.pollutionMaterialProfessionName = key
                        aqModel.pollutionUnit = "μg/m3"
                        aqModel.normalStandardNumber = "<=54\(aqModel.pollutionUnit!)"
                        aqModel.pollutionNumber = String(arrFirstDouble)
                        aqModel.percentageNumberColor = aQStatusModel.statusThemeColor(aQStatusModel.levelWithAQI(Int(arrFirstDouble / 12 * 50)))
                        aqModel.percentageNumber = String(format: "%.2f", arrFirstDouble * 100 / 54) + "%"
                        aQSModelArray?.append(aqModel)
                    } else if key == "no2" {
                        aqModel.pollutionName = "Nitrogen Dioxide";
                        aqModel.pollutionMaterialProfessionName = "NO2"
                        aqModel.pollutionUnit = "ppb"
                        aqModel.pollutionNumber = String(arrFirstDouble)
                        aqModel.normalStandardNumber = "<=53\(aqModel.pollutionUnit!)"
                        aqModel.percentageNumberColor = aQStatusModel.statusThemeColor(aQStatusModel.levelWithAQI(Int(arrFirstDouble / 12 * 50)))
                        aqModel.percentageNumber = String(format: "%.2f", arrFirstDouble * 100 / 53) + "%"
                        aQSModelArray?.append(aqModel)
                    } else if key == "so2" {
                        aqModel.pollutionName = "Sulfur Dioxide";
                        aqModel.pollutionMaterialProfessionName = "SO2"
                        aqModel.pollutionUnit = "ppb"
                        aqModel.pollutionNumber = String(arrFirstDouble)
                        aqModel.normalStandardNumber = "<=35\(aqModel.pollutionUnit!)"
                        aqModel.percentageNumberColor = aQStatusModel.statusThemeColor(aQStatusModel.levelWithAQI(Int(arrFirstDouble / 12 * 50)))
                        aqModel.percentageNumber = String(format: "%.2f", arrFirstDouble * 100 / 35) + "%"
                        aQSModelArray?.append(aqModel)
                    } else if key == "co" {
                        aqModel.pollutionName = "Carbon Monoxide";
                        aqModel.pollutionMaterialProfessionName = "CO"
                        aqModel.pollutionUnit = "ppm"
                        aqModel.pollutionNumber = String(arrFirstDouble)
                        aqModel.normalStandardNumber = "<=4.4\(aqModel.pollutionUnit!)"
                        aqModel.percentageNumberColor = aQStatusModel.statusThemeColor(aQStatusModel.levelWithAQI(Int(arrFirstDouble / 12 * 50)))
                        aqModel.percentageNumber = String(format: "%.2f", arrFirstDouble * 100 / 4.4) + "%"
                        aQSModelArray?.append(aqModel)
                    } else if key == "O3" {
                        aqModel.pollutionName = "Ozone";
                        aqModel.pollutionMaterialProfessionName = "O3"
                        aqModel.pollutionUnit = "ppb"
                        aqModel.pollutionNumber = String(arrFirstDouble)
                        aqModel.normalStandardNumber = "<=54\(aqModel.pollutionUnit!)"
                        aqModel.percentageNumberColor = aQStatusModel.statusThemeColor(aQStatusModel.levelWithAQI(Int(arrFirstDouble / 12 * 50)))
                        aqModel.percentageNumber = String(format: "%.2f", arrFirstDouble * 100 / 54) + "%"
                        aQSModelArray?.append(aqModel)
                    }
                }
            }
        }
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return self as! NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object { return true }
        guard (object as? AirQualityAPIModel) != nil else { return false }
        return false
    }
    
    required init() {}
}
