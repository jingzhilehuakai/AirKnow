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

// MARK: HomePageSectionViewController, container of tableview
class HomePageSectionViewController: ListSectionController {
    
    // MARK: Retention Cell
    var retentionCell: HomePageSectionViewControllerCell?
    
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
        adapter.scrollViewDelegate = self
        
        self.retentionCell = cell
        
        cell.location.locationName.text = "BeiJing"
        cell.location.updateTime.text = "21.02.2017 00:00"
        
        return cell
    }
    
    override func didUpdate(to object: Any) {
        
    }
}

// ScrollView Delegate
extension HomePageSectionViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY: CGFloat = scrollView.contentOffset.y
        if offsetY + AirKnowConfig.homePageCollectionViewEdgeTopPadding > 0 {
            var alpha = 1 - (offsetY + AirKnowConfig.homePageCollectionViewEdgeTopPadding) / AirKnowConfig.homePageCollectionViewEdgeTopPadding
            alpha = alpha <= 0 ? 0 : alpha >= 1 ? 1 : alpha
            let superView = scrollView.superview?.superview
            if superView is HomePageSectionViewControllerCell {
                let cell: HomePageSectionViewControllerCell = superView as! HomePageSectionViewControllerCell
                cell.location.setAlpppha(alpha)
            }
        }
    }
}

// MARK: ListAdapterDataSource
extension HomePageSectionViewController: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return [AirQualityStatusModel(AQI: 15, level: 0, status: "Good", warmLog: "Perfect perfect, very perfect") as ListDiffable,
                0 as ListDiffable]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is AirQualityStatusModel {
            return HomePageAirQualityStatusSectionController()
        } else {
            return HomePageAirQualitySectionController()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
