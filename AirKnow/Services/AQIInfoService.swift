//
//  getCityAQIInfoApi.swift
//  AirKnow
//
//  Created by cbang on 2017/10/13.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import YTKNetwork
import HandyJSON
import SwifterSwift
import AFNetworking

class AQIInfoApi: YTKRequest {
    
    var cityIdInternal: String! = ""
    
    init(_ cityId: String!) {
        super.init()
        cityIdInternal = cityId
    }
    
    override func requestUrl() -> String {
        return "/aqicn/json/android/@" + cityIdInternal
    }
    
    override func requestMethod() -> YTKRequestMethod {
        return YTKRequestMethod.GET
    }

    override func baseUrl() -> String {
        return "https://aqicn.org"
    }
    
    override func requestTimeoutInterval() -> TimeInterval {
        return 30
    }
}

class AQIInfoService: NSObject {
    class func goGet(_ cityId: String!, completetion: @escaping (AirQualityAPIModel?, NSError?)->()) {
        let infoApi = AQIInfoApi.init(cityId)
        
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
            
            airQualityAPIModel.udid = cityId
            airQualityAPIModel.jsonString = request.responseString
            completetion(airQualityAPIModel, error)
        }) { (request) in
            error = NSError.init(domain: AirKnowConfig.networkServiceErrorDomain, code: AirKnowConfig.airKnowNetworkError.networkLinkErrorCode.rawValue, userInfo: nil)
            completetion(nil, error)
        }
    }
}
