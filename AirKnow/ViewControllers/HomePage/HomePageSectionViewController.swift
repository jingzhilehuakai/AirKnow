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
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.theme_backgroundColor = AirKnowConfig.airKnowGlobalHomePageVCBGStringStyels
        view.alwaysBounceHorizontal = false
        self.contentView.addSubview(view)
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.frame
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
        return [0 as ListDiffable]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return HomePageAirCoditionSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
