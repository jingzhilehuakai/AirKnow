
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
final class HomePageSCMonitorLocationCell: UICollectionViewCell, UIScrollViewDelegate {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(location)
        contentView.addSubview(collectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureWithModel(_ model: AirQualityAPIModel?) {
        guard let modelInternal = model else {
            return
        }
        
        if NSLocale.preferredLanguages.first == "zh-Hans-CN" {
            location.locationName.text = (modelInternal.namena != "" && modelInternal.namena != nil) ? modelInternal.namena : modelInternal.nameen
            if let validTime = modelInternal.utimecn {
                location.updateTime.text = "上次更新时间 - " + validTime
            }
        } else {
            location.locationName.text = modelInternal.nameen
            if let validTime = modelInternal.utime {
                location.updateTime.text = "Last updated on " + validTime
            }
        }
    }
    
    //MARK: Location Name Background View
    lazy var location: AirKnowMonitorLocationView = {
        let locationInternal = AirKnowMonitorLocationView.init(frame: self.contentView.frame)
        locationInternal.theme_backgroundColor = AirKnowConfig.homePageVCBGStyles
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
