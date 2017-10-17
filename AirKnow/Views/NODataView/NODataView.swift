//
//  NODataView.swift
//  AirKnow
//
//  Created by cbang on 2017/10/17.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit
import SnapKit

class NODataView: UIView {

    lazy var imageView: UIImageView = {
        let imageViewInternal = UIImageView.init()
        imageViewInternal.theme_image = AirKnowConfig.noDataViewImageStyles
        return imageViewInternal
    }()
    
    lazy var titleLable: UILabel = {
        let titleLabel = UILabel.init()
        titleLabel.font = UIFont.init(name: "Avenir-Roman", size: 15)
        titleLabel.theme_textColor = AirKnowConfig.noDataViewTitleBackgroundColorStyles
        titleLabel.text = AirKnowConfig.noDataViewTitleString
        return titleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        func configureSubviews() {
            self.addSubview(imageView)
            imageView.snp.makeConstraints { (make) in
                make.centerX.equalTo(self)
                make.centerY.equalTo(self).offset(AirKnowConfig.noDataViewCenterYOffset)
                make.height.width.equalTo(AirKnowConfig.noDataViewSideLength)
            }
            
            self.addSubview(titleLable)
            titleLable.snp.makeConstraints { (make) in
                make.centerX.equalTo(self)
                make.top.equalTo(imageView.snp.bottom).offset(AirKnowConfig.noDataViewTitleTopInset)
            }
        }
        configureSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
}
