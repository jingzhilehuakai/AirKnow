//
//  LocationSearchService.swift
//  AirKnow
//
//  Created by 王净 on 2017/10/22.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit
import YTKNetwork

class LocationSearchApi: YTKRequest {
    var locationStringInternal: String! = ""
    
    init(_ locationStr: String!) {
        super.init()
        locationStringInternal = locationStr
    }
    
    override func requestUrl() -> String {
        return "/search/"
    }
    
    override func requestMethod() -> YTKRequestMethod {
        return YTKRequestMethod.GET
    }
    
    override func requestArgument() -> Any? {
        return ["keyword": locationStringInternal,
                "token": "7ad9fa10b8f28b6792b81e2c8e74c7f50e2c2836"]
    }
}

class LocationSearchService: UISearchBar {
    
    static let shareInstance = LocationSearchService()
    var searchAPIs = Array<YTKRequest>()
    
    class func cancleAllPreAPIs() {
        for (index, item) in LocationSearchService.shareInstance.searchAPIs.enumerated() {
            item.stop()
            LocationSearchService.shareInstance.searchAPIs.remove(at: index)
        }
    }
    
    class func search(locationStr ls: String, completetion: @escaping ([AirQualitySearchResultModel]?, NSError?)->()) {
        var error: NSError?

        if ls.characters.count <= 0 {
            error = NSError.init(domain: AirKnowConfig.networkServiceErrorDomain, code: AirKnowConfig.airKnowNetworkError.inputDataErrorCode.rawValue, userInfo: nil)

            completetion(nil, error)
            return
        }
        
        let searchAPI = LocationSearchApi.init(ls)

        searchAPI.startWithCompletionBlock(success: { (request) in
            guard let responseStr = request.responseString else {
                error = NSError.init(domain: AirKnowConfig.networkServiceErrorDomain, code: AirKnowConfig.airKnowNetworkError.responseDataHandlerCode.rawValue, userInfo: nil)
                completetion(nil, error)
                return
            }
            
            guard let searchResultModels = [AirQualitySearchResultModel].deserialize(from: responseStr, designatedPath: "data") else {
                error = NSError.init(domain: AirKnowConfig.networkServiceErrorDomain, code: AirKnowConfig.airKnowNetworkError.modelDeserializeError.rawValue, userInfo: nil)
                completetion(nil, error)
                return
            }
            
            let filterArr = searchResultModels.filter({ (model) -> Bool in
                return model?.aqi == "-" || model?.aqi == "" ? false : true
            })

            completetion(filterArr as? [AirQualitySearchResultModel], nil)
        }) { (request) in
            error = NSError.init(domain: AirKnowConfig.networkServiceErrorDomain, code: AirKnowConfig.airKnowNetworkError.networkLinkErrorCode.rawValue, userInfo: nil)
            completetion(nil, error)
        }
        
        LocationSearchService.shareInstance.searchAPIs.append(searchAPI)
    }
}
