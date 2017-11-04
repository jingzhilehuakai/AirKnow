//
//  HomePageAirQualitySectionControllerExpendCell.swift
//  AirKnow
//
//  Created by 陈超邦 on 2017/9/16.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit
import SnapKit

class HomePageAirQualitySCExpendCell: UICollectionViewCell {
    
    fileprivate var airQualtyCellView: HomePageAirQualitySCCell!
//    fileprivate var airHistoryGraphView: ScrollableGraphView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        airQualtyCellView = HomePageAirQualitySCCell.init(frame: .zero)
        airQualtyCellView?.isUserInteractionEnabled = false
        self.contentView.addSubview(airQualtyCellView)
        airQualtyCellView?.snp.makeConstraints({ (make) in
            make.left.top.right.equalTo(self.contentView)
            make.height.equalTo(AirKnowConfig.homePageAirQualitySectionControllerCellHeight);
        })
        
//        airHistoryGraphView = ScrollableGraphView(frame: CGRect.zero, dataSource: self)
//        self.contentView.addSubview(airHistoryGraphView!)
//        airHistoryGraphView?.snp.makeConstraints({ (make) in
//            make.left.right.bottom.equalTo(self.contentView)
//            make.top.equalTo(airQualtyCellView.snp.bottom)
//        })
    }
    
    func configureWithModel(_ aqModel: AirQualityModel?, _ nearModel: AirQualityNearestAPIModel?) {
        guard aqModel != nil && nearModel != nil else {
            return
        }
        
        airQualtyCellView?.configureWithModel(aqModel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
