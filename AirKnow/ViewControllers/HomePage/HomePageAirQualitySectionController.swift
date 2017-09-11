//
//  HomePageAirQualitySectionController.swift
//  AirKnow
//
//  Created by 陈超邦 on 2017/9/8.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import IGListKit

class HomePageAirQualitySectionController: ListSectionController {
    
    override init() {
        super.init()
        self.minimumInteritemSpacing = 2
        self.minimumLineSpacing = 2
        self.inset = UIEdgeInsets.init(top: 2, left: 0, bottom: 2, right: 0)
    }
    
    // MARK: Section DataSource
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize.init(width: collectionContext!.containerSize.width, height: AirKnowConfig.homePageAirQualitySectionControllerCellHeight)
    }
    
    override func numberOfItems() -> Int {
        return 10
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: HomePageAirQualitySectionControllerCell.self, for: self, at: index) as? HomePageAirQualitySectionControllerCell else {
            fatalError()
        }
        
         cell.pollutionMaterialName.text = "Particular Matter"
         cell.pollutionMaterialProfessionName.text = "PM10:"
         cell.pollutionNumber.text = "888"
         cell.pollutionUnit.text = "ug/m3"
         cell.percentageNumber.text = "500%"
         cell.normalStandardNumber.text = "50 ug/m"
         cell.normalHolderLabel.text = "NORM"
        
        return cell
    }
    
    override func didUpdate(to object: Any) {
        
    }
}
