//
//  SearchResultSCCell.swift
//  AirKnow
//
//  Created by 王净 on 2017/10/22.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit
import TTGTagCollectionView

class SearchResultSCCell: UICollectionViewCell {
    lazy var title: UILabel = {
        let titleInternal = UILabel()
        titleInternal.theme_textColor = AirKnowConfig.searchContentTextColorStyle
        titleInternal.font = AirKnowConfig.searchContentTextFont
        return titleInternal
    }()
    
    lazy var tagListView: TTGTextTagCollectionView = {
        let tagListViewInternal = TTGTextTagCollectionView()
        tagListViewInternal.alignment = TTGTagCollectionAlignment.right
        return tagListViewInternal
    }()
    
    lazy var spiltLine: UIView = {
        let spiltLineInternal = UIView()
        spiltLineInternal.backgroundColor = UIColor.lightGray
        spiltLineInternal.alpha = 0.3
        return spiltLineInternal
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        func setupSubViews() {
            self.contentView.addSubview(tagListView)
            tagListView.snp.makeConstraints { (make) in
                make.right.equalTo(self.contentView).offset(AirKnowConfig.searchBarRightPadding)
                make.centerY.equalTo(self.contentView)
                make.height.equalTo(self.contentView).multipliedBy(0.5)
                make.width.equalTo(AirKnowConfig.searchTagViewWidth)
            }
            
            self.contentView.addSubview(title)
            title.snp.makeConstraints { (make) in
                make.left.equalTo(self.contentView).offset(AirKnowConfig.searchBarLeftPadding)
                make.centerY.equalTo(self.contentView)
                make.right.equalTo(tagListView.snp.left).offset(-20)
                make.height.equalTo(self.contentView)
            }
            
            self.contentView.addSubview(spiltLine)
            spiltLine.snp.makeConstraints { (make) in
                make.left.equalTo(self.contentView).offset(AirKnowConfig.searchBarLeftPadding)
                make.bottom.equalTo(self.contentView)
                make.right.equalTo(self.contentView)
                make.height.equalTo(0.5)
            }
        }
        setupSubViews()
    }
    
    func configure(model md: AirQualitySearchResultModel?) {
        if let mdInternal = md {
            self.tagListView.removeAllTags()
            
            if let aqiStr = mdInternal.aqi, let apiInt = Int(aqiStr) {
                let config = TTGTextTagConfig()
                config.tagTextFont = title.font
                config.tagShadowColor = UIColor.clear
                config.tagBackgroundColor = AirKnowConfig.colorWithAQI(apiInt)
                config.tagTextColor = UIColor.white
                self.tagListView.addTag(mdInternal.aqi, with: config)
            }
            
            if let station = mdInternal.station, let name = station["name"] as? String {
                self.title.text = name
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
