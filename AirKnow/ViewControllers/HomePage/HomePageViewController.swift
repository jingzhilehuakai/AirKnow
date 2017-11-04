//
//  HomePageViewController.swift
//  AirKnow
//
//  Created by 陈超邦 on 2017/9/8.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit
import IGListKit
import SnapKit
import SwiftTheme
import CHIPageControl
import Spring
import MBProgressHUD

class HomePageViewController: UIViewController {
    
    //MARK: Origin Section Index
    var originIndex: NSInteger = 0
    
    // MARK: Page Contrl
    var pageControl: CHIPageControlJalapeno?
    
    // ...
    var numberOfPages = 3
    
    // MARK: List Adapter
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    // MARK: CollectionView
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionViewInternal = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionViewInternal.theme_backgroundColor = AirKnowConfig.homePageVCBGStyles
        collectionViewInternal.isPagingEnabled = true
        collectionViewInternal.showsVerticalScrollIndicator = false
        collectionViewInternal.showsHorizontalScrollIndicator = false
        if #available(iOS 10.0, *) {
            collectionViewInternal.isPrefetchingEnabled = false
        }
        return collectionViewInternal
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(startLocationUpdate(_:)), name: NSNotification.Name(rawValue: "startLocationUpdateNotification"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(finishLocationUpdate(_:)), name: NSNotification.Name(rawValue: "finishLocationUpdateNotification"), object: nil)

        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
        adapter.scrollViewDelegate = self
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "startLocationUpdateNotification"), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "finishLocationUpdateNotification"), object: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startLocationUpdate(_ notification: NSNotification) {
        MBProgressHUD.showAdded(to: UIApplication.shared.keyWindow!, animated: true)
    }
    
    func finishLocationUpdate(_ notification: NSNotification) {
        MBProgressHUD.hide(for: UIApplication.shared.keyWindow!, animated: true)
        
        if let errorStr: String = notification.userInfo?["Er"] as? String {
            if errorStr != "" {
                let hud = MBProgressHUD.showAdded(to: UIApplication.shared.keyWindow!, animated: true)
                hud.mode = MBProgressHUDMode.text
                hud.label.text = errorStr
                hud.hide(animated: true, afterDelay: 1.5)
                return
            }
        }
        
        guard let dataArr: [AirQualityAPIModel] = AirKnowLocationManager.sharedInstance.getAllCityModels() else {
            return
        }
        
        if let operationStr: String = notification.userInfo?["Operation"] as? String {
            
            if operationStr == "Add" {
                if dataArr.count != pageControl?.numberOfPages {
                    adapter.reloadData(completion: { (bool) in
                        self.collectionView.setContentOffset(CGPoint.init(x: self.collectionView.contentSize.width - self.collectionView.frame.size.width, y: 0), animated: false)
                        self.pageControl?.progress = Double(self.collectionView.numberOfItems - 1)
                    })
                }
            }
            
            if operationStr == "Update" {
                if dataArr.count == pageControl?.numberOfPages {
                    adapter.reloadData(completion: nil)
                }
            }
        }
    }
}

// MARK: ListAdapterDataSource
extension HomePageViewController: ListAdapterDataSource {

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        if let dataArr: [AirQualityAPIModel] = AirKnowLocationManager.sharedInstance.getAllCityModels() {
            pageControl?.numberOfPages = dataArr.count
            self.numberOfPages = dataArr.count
            return dataArr
        }
        
        pageControl?.numberOfPages = 0
        self.numberOfPages = 0
        return []
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        let homePageSectionViewController = HomePageSC()
        return homePageSectionViewController
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return AirKnowNODataView()
    }
}

// MARK: ScrollViewDelegate
extension HomePageViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let total = scrollView.contentSize.width - scrollView.bounds.width
        let offset = scrollView.contentOffset.x
        let percent = Double(offset / total)
        let progress = percent * Double(self.numberOfPages - 1)
        pageControl?.progress = progress
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentIndex: NSInteger = NSInteger(fabs(collectionView.contentOffset.x) / collectionView.frame.size.width);
        if originIndex != currentIndex {
            if let homePageSectionViewController: HomePageSC = adapter.sectionController(forSection: originIndex) as? HomePageSC {
                homePageSectionViewController.retentionCell?.collectionView.setContentOffset(CGPoint.init(x: 0, y: -AirKnowConfig.homePageCollectionViewEdgeTopPadding), animated: true)
                homePageSectionViewController.retentionCell?.location.setAlpppha(1)
            }
        }
        originIndex = currentIndex
    }
}
