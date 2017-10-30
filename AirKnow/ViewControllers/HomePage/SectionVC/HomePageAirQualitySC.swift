//
//  HomePageAirQualitySectionController.swift
//  AirKnow
//
//  Created by 陈超邦 on 2017/9/8.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import IGListKit

class HomePageAirQualitySC: ListSectionController {
    
    var expendCellIndex: Int?
    
    var unexpenedData: Array<AirQualityModel>?
    var expendData: Array<AirQualityNearestAPIModel>?
    
    override init() {
        super.init()
        self.minimumInteritemSpacing = 2
        self.minimumLineSpacing = 2
        self.inset = UIEdgeInsets.init(top: 2, left: 0, bottom: 2, right: 0)
    }
    
    // MARK: Section DataSource
    override func sizeForItem(at index: Int) -> CGSize {
        if expendCellIndex != nil && expendCellIndex == index {
            return CGSize.init(width: (collectionContext?.containerSize.width)!, height: AirKnowConfig.homePageAirQualityHistoryGraphViewHeight + AirKnowConfig.homePageAirQualitySectionControllerCellHeight)
        } else {
            return CGSize.init(width: collectionContext!.containerSize.width, height: AirKnowConfig.homePageAirQualitySectionControllerCellHeight)
        }
    }
    
    override func numberOfItems() -> Int {
        return unexpenedData != nil ? unexpenedData!.count : 0
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        var targetCell: UICollectionViewCell!
        
        if expendCellIndex != nil && expendCellIndex == index {
            guard let cell = collectionContext?.dequeueReusableCell(of: HomePageAirQualitySCExpendCell.self, for: self, at: index)  as? HomePageAirQualitySCExpendCell else {
                fatalError()
            }
            
            targetCell = cell
            cell.configureWithModel(unexpenedData?[index], expendData?[index])
        } else {
            guard let cell = collectionContext?.dequeueReusableCell(of: HomePageAirQualitySCCell.self, for: self, at: index) as? HomePageAirQualitySCCell else {
                fatalError()
            }
            
            targetCell = cell
            cell.configureWithModel(unexpenedData?[index])
        }
        
        if targetCell == nil {
            fatalError()
        }
       
        return targetCell
    }
    
    override func didUpdate(to object: Any) {
        if let ob = object as? AirQualityAPIModel {
            unexpenedData = ob.aQSModelArray
            expendData = ob.nearest
        }
    }
    
    override func didSelectItem(at index: Int) {
//        collectionContext?.performBatch(animated: true, updates: { (ListBatchContext) in
//            if self.expendCellIndex == nil {
//                ListBatchContext.reload(in: self, at: IndexSet.init(integer: index))
//                self.expendCellIndex = index
//            } else if self.expendCellIndex != nil && self.expendCellIndex == index {
//                ListBatchContext.reload(in: self, at: IndexSet.init(integer: index))
//                self.expendCellIndex = nil
//            } else {
//                ListBatchContext.reload(in: self, at: IndexSet.init(integer: self.expendCellIndex!))
//                ListBatchContext.reload(in: self, at: IndexSet.init(integer: index))
//                self.expendCellIndex = index
//            }
//        }, completion: nil)
    }
}
