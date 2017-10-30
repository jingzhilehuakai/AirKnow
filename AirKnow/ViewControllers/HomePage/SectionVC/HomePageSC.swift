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
class HomePageSC: ListSectionController {
    
    override init() {
        super.init()
       
        if #available(iOS 10.0, *) {
            Timer.scheduledTimer(withTimeInterval: 5 * 60, repeats: true, block: { (timer) in
                self.needUpdateBlock != nil ? self.needUpdateBlock!() : nil
            })
        } else {
            // Fallback on earlier versions
        }
    }

    var needUpdateBlock: (() -> ())?

    // MARK: Fetching data
    var targetData: AirQualityAPIModel?
    
    // MARK: Retention Cell
    var retentionCell: HomePageSCMonitorLocationCell?
    
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
        guard let cell = collectionContext?.dequeueReusableCell(of: HomePageSCMonitorLocationCell.self, for: self, at: index) as? HomePageSCMonitorLocationCell else {
            fatalError()
        }
        
        adapter.collectionView = cell.collectionView
        adapter.scrollViewDelegate = self
        self.retentionCell = cell
        cell.configureWithModel(targetData)
 
        return cell
    }
    
    override func didUpdate(to object: Any) {
        targetData = object as? AirQualityAPIModel
    }
}

// ScrollView Delegate
extension HomePageSC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY: CGFloat = scrollView.contentOffset.y
        if offsetY + AirKnowConfig.homePageCollectionViewEdgeTopPadding > 0 {
            var alpha = 1 - (offsetY + AirKnowConfig.homePageCollectionViewEdgeTopPadding) / AirKnowConfig.homePageCollectionViewEdgeTopPadding
            alpha = alpha <= 0 ? 0 : alpha >= 1 ? 1 : alpha
            let superView = scrollView.superview?.superview
            if superView is HomePageSCMonitorLocationCell {
                let cell: HomePageSCMonitorLocationCell = superView as! HomePageSCMonitorLocationCell
                cell.location.setAlpppha(alpha)
            }
        }
    }
}

// MARK: ListAdapterDataSource
extension HomePageSC: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        if let data = targetData {
            return [data.aQStatusModel, data]
        }
        return []
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is AirQualityStatusModel {
            return HomePageAirQualityStatusSC()
        } else {
            return HomePageAirQualitySC()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
