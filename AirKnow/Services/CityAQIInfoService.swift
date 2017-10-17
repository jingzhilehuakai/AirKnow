//
//  getCityAQIInfoApi.swift
//  AirKnow
//
//  Created by cbang on 2017/10/13.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import YTKNetwork
import HandyJSON

class CityAQIInfoApi: YTKRequest {
    
    var cityIdInternal: NSString! = ""
    
    init(_ cityId: NSString!) {
        super.init()
        cityIdInternal = cityId
    }
    
    override func requestUrl() -> String {
        return "/getAQIInfo"
    }
    
    override func requestMethod() -> YTKRequestMethod {
        return YTKRequestMethod.GET
    }
    
    override func requestArgument() -> Any? {
        return ["cityId": cityIdInternal]
    }
}

class CityAQIInfoService: NSObject {
    class func getWithCityID(_ cityId: NSString!, completetion: @escaping (AirQualityAPIModel?, NSError?)->()) {
        let infoApi = CityAQIInfoApi.init(cityId)
        
        var error: NSError?
        infoApi.startWithCompletionBlock(success: { (request) in
            guard let responseString = request.responseString else {
                error = NSError.init(domain: AirKnowConfig.networkServiceErrorDomain, code: AirKnowConfig.airKnowNetworkError.responseDataHandlerCode.rawValue, userInfo: nil)
                completetion(nil, error)
                return
            }
            
            guard let airQualityAPIModel = AirQualityAPIModel.deserialize(from: responseString) else {
                error = NSError.init(domain: AirKnowConfig.networkServiceErrorDomain, code: AirKnowConfig.airKnowNetworkError.modelDeserializeError.rawValue, userInfo: nil)
                completetion(nil, error)
                return
            }
            
            airQualityAPIModel.jsonString = request.responseString
            completetion(airQualityAPIModel, error)
        }) { (request) in
            error = NSError.init(domain: AirKnowConfig.networkServiceErrorDomain, code: AirKnowConfig.airKnowNetworkError.networkLinkErrorCode.rawValue, userInfo: nil)
            completetion(nil, error)
        }
    }
}
