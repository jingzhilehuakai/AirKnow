//
//  SearchViewControllerSC.swift
//  AirKnow
//
//  Created by 王净 on 2017/10/22.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import IGListKit

class SearchViewControllerSC: ListSectionController {
    
    var didSelectItem: ((Int) -> Void)?
    var targetData: AirQualitySearchResultModel?
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize.init(width: Int(collectionContext!.containerSize.width), height: AirKnowConfig.searchContentCellHieght)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: SearchResultSCCell.self, for: self, at: index) as? SearchResultSCCell else {
            fatalError()
        }
        
        cell.configure(model: targetData)
        
        return cell
    }
    
    override func didUpdate(to object: Any) {
        targetData = (object as? AirQualitySearchResultModel)
    }
    
    override func didSelectItem(at index: Int) {
        NotificationCenter.default.post(name: NSNotification.Name("startLocationUpdateNotification"), object: self, userInfo: nil)
        AirKnowLocationManager.sharedInstance.addNewLocation(searchResultModel: targetData!) { (str) in
            NotificationCenter.default.post(name: NSNotification.Name("finishLocationUpdateNotification"), object: self, userInfo: ["Er": str ?? "", "Operation": "Add"])
        }
        didSelectItem != nil ? didSelectItem!(index) : nil
    }
}
