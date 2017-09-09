//
//  HomePageSectionViewController.swift
//  AirKnow
//
//  Created by 陈超邦 on 2017/9/8.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import IGListKit
import SwifterSwift
import SwiftTheme

// MARK: HomePageSectionViewControllerCell, contanier of air cells
final class HomePageSectionViewControllerCell: UICollectionViewCell {
    
    // City Name Background View
    lazy var locationName: MonitorLocationView = {
        let locationNameInternal = MonitorLocationView.init(frame: self.contentView.frame)
        locationNameInternal.theme_backgroundColor = AirKnowConfig.airKnowGlobalHomePageVCBGStringStyels
        return locationNameInternal
    }()
    
    // CollectionView Above CityBGView
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionViewInternal = UICollectionView(frame: self.locationName.frame, collectionViewLayout: layout)
        collectionViewInternal.backgroundColor = UIColor.clear
        collectionViewInternal.alwaysBounceHorizontal = false
        collectionViewInternal.contentInset = UIEdgeInsets.init(top: AirKnowConfig.airKnowHomePageCollectionViewEdgePadding, left: 0, bottom: 0, right: 0)
        return collectionViewInternal
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(locationName)
        contentView.addSubview(collectionView)
    }
}

// MARK: HomePageSectionViewController, container of tableview
class HomePageSectionViewController: ListSectionController {
    
    // MARK: List Adapter
    lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(),
                                  viewController: self.viewController)
        adapter.dataSource = self
        return adapter
    }()
    
    // MARK: Section DataSource
    override func sizeForItem(at index: Int) -> CGSize {
        return collectionContext!.containerSize
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: HomePageSectionViewControllerCell.self, for: self, at: index) as? HomePageSectionViewControllerCell else {
            fatalError()
        }
        adapter.collectionView = cell.collectionView
        return cell
    }
    
    override func didUpdate(to object: Any) {
        
    }
}

// MARK: ListAdapterDataSource
extension HomePageSectionViewController: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return [AirConditionStatusModel(AQI: 0, status: "", warmLog: "") as ListDiffable,
                0 as ListDiffable]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is AirConditionStatusModel {
            return HomePageAirCoditionStatusSectionController()
        } else {
            return HomePageAirCoditionSectionController()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
