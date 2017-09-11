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

class HomePageViewController: UIViewController {
    
    var pageControl: CHIPageControlJalapeno?
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
        collectionViewInternal.theme_backgroundColor = AirKnowConfig.homePageVCBGStringStyels
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
        
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
        adapter.scrollViewDelegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

// MARK: ListAdapterDataSource
extension HomePageViewController: ListAdapterDataSource {

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return [
            14,
            6,
            2
            ] as [ListDiffable]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return HomePageSectionViewController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}

// MRRK: ScrollViewDelegate
extension HomePageViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let total = scrollView.contentSize.width - scrollView.bounds.width
        let offset = scrollView.contentOffset.x
        let percent = Double(offset / total)
        let progress = percent * Double(self.numberOfPages - 1)
        pageControl?.progress = progress
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //let currentIndex: NSInteger = NSInteger(fabs(collectionView.contentOffset.x) / collectionView.frame.size.width);
    }
}
