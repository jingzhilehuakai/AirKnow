//
//  HomePageAirQualitySectionControllerExpendCell.swift
//  AirKnow
//
//  Created by 陈超邦 on 2017/9/16.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit
import SnapKit

class HomePageAirQualitySectionControllerExpendCell: UICollectionViewCell {
    
    fileprivate var airQualtyCellView: HomePageAirQualitySectionControllerCell?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        airQualtyCellView = HomePageAirQualitySectionControllerCell.init(frame: .zero)
        airQualtyCellView?.isUserInteractionEnabled = false
        self.contentView.addSubview(airQualtyCellView!)
        airQualtyCellView?.snp.makeConstraints({ (make) in
            make.left.top.right.equalTo(self.contentView)
            make.height.equalTo(AirKnowConfig.homePageAirQualitySectionControllerCellHeight);
        })
    }
    
    func configureWithModel(_ model: AirQualityModel?) {
        guard model != nil else {
            return
        }
        
        airQualtyCellView?.configureWithModel(model)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
