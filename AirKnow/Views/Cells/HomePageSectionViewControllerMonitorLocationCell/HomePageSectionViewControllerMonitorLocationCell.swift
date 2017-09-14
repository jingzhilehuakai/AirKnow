
//
//  HomePageSectionViewControllerCell.swift
//  AirKnow
//
//  Created by 陈超邦 on 2017/9/11.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit
import SwifterSwift

// MARK: HomePageSectionViewControllerCell, contanier of air cells
final class HomePageSectionViewControllerMonitorLocationCell: UICollectionViewCell, UIScrollViewDelegate {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(location)
        contentView.addSubview(collectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureWithModel(_ model: AirMonitorLocationModel?) {
        guard let modelInternal = model else {
            return
        }
        
        location.locationName.text = modelInternal.location
        location.updateTime.text = modelInternal.updateTime
    }
    
    //MARK: Location Name Background View
    lazy var location: MonitorLocationView = {
        let locationInternal = MonitorLocationView.init(frame: self.contentView.frame)
        locationInternal.theme_backgroundColor = AirKnowConfig.homePageVCBGStringStyels
        return locationInternal
    }()
    
    //MARK: CollectionView Above CityBGView
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionViewInternal = UICollectionView(frame: self.location.frame, collectionViewLayout: layout)
        collectionViewInternal.backgroundColor = UIColor.clear
        collectionViewInternal.alwaysBounceHorizontal = false
        collectionViewInternal.showsVerticalScrollIndicator = false
        collectionViewInternal.showsHorizontalScrollIndicator = false
        let bottomInset = AirKnowConfig.shouldFIxTabbarInset ? AirKnowConfig.tabbarHeight : 0
        collectionViewInternal.contentInset = UIEdgeInsets.init(top: AirKnowConfig.homePageCollectionViewEdgeTopPadding, left: 0, bottom: bottomInset, right: 0)
        return collectionViewInternal
    }()
}
