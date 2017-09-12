//
//  HomePageAirQualityStatusSectionController.swift
//  AirKnow
//
//  Created by 陈超邦 on 2017/9/9.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import IGListKit

class HomePageAirQualityStatusSectionController: ListSectionController {
    
    // MARK: Section DataSource
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize.init(width: collectionContext!.containerSize.width, height: AirKnowConfig.homePageAirQualityStatusSectionControllerCellHeight)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: HomePageAirQualityStatusSectionControllerCell.self, for: self, at: index) as? HomePageAirQualityStatusSectionControllerCell else {
            fatalError()
        }
        cell.airQualityStatusData = AirQualityStatusModel(AQI: 15, level: 0, status: "Good", warmLog: "Perfect perfect, very perfect")
        return cell
    }
    
    override func didUpdate(to object: Any) {
        
    }
}
