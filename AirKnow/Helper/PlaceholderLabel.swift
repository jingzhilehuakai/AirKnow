
//
//  PlaceholderLabel.swift
//  AirKnow
//
//  Created by 陈超邦 on 2017/9/11.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit

class PlaceholderLabel: UILabel {
    override var text: String? {
        didSet {
            if text?.length != 0 {
                self.backgroundColor = UIColor.clear
                self.theme_backgroundColor = nil
            }
        }
    }
}
