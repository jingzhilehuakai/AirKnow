
//
//  UITabbar+AirKnow.swift
//  AirKnow
//
//  Created by 陈超邦 on 2017/9/8.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit

extension UITabBar {
    
    // Used To Change Theme Color
    override open var backgroundColor: UIColor? {
        didSet {
            if backgroundColor != nil {
                self.backgroundImage = UIImage.init(color: backgroundColor!, size: self.bounds.size)
            }
        }
    }
    
    // Control The Height of That Bar
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = AirKnowConfig.airKnowTabbarHeight
        return sizeThatFits
    }
}
