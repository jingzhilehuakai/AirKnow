//
//  HomePageAirQualityStatusSC.swift
//  AirKnow
//
//  Created by 陈超邦 on 2017/9/9.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import IGListKit

class HomePageAirQualityStatusSC: ListSectionController {
    
    var targetData: AirQualityStatusModel?
    
    // MARK: Section DataSource
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize.init(width: collectionContext!.containerSize.width, height: AirKnowConfig.homePageAirQualityStatusSectionControllerCellHeight)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: HomePageAirQualityStatusSCCell.self, for: self, at: index) as? HomePageAirQualityStatusSCCell else {
            fatalError()
        }
        cell.airQualityStatusData = targetData
        return cell
    }
    
    override func didUpdate(to object: Any) {
        targetData = object as? AirQualityStatusModel
    }
}
