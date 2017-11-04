//
//  AirKnowSearchBar.swift
//  AirKnow
//
//  Created by 王净 on 2017/10/19.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit
import SwifterSwift

class AirKnowSearchBar: UISearchBar {

    var customeTF: UITextField?
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        func configureSearchBarUI() {
            for itemView in self.subviews {
                if (itemView.isKind(of: UIView.self)) {
                    // remove default backgroundView
                    itemView.subviews[0].removeFromSuperview()
                    
                    // update default input textField style
                    if (itemView.subviews.count > 0 && itemView.subviews[0].isKind(of: UITextField.self)) {
                        let customTextField: UITextField = itemView.subviews[0] as! UITextField
                        customTextField.textColor = UIColor.gray
                        customTextField.font = AirKnowConfig.searchBarTextFont
                        let placeholderColor: UIColor = UIColor.lightGray
                        customTextField.attributedPlaceholder = NSAttributedString(string: "input to search", attributes: [NSForegroundColorAttributeName:placeholderColor, NSFontAttributeName:AirKnowConfig.searchBarTextFont])
                        customTextField.leftView = UIImageView(image: #imageLiteral(resourceName: "search_icon_box"))
                        
                        if let searchFieldBackgroundView: UIImageView = customTextField.value(forKey: "_systemBackgroundView") as? UIImageView {
                            searchFieldBackgroundView.image = UIImage.init(color: UIColor.white, size: CGSize.init(width: 1000, height: 1000))
                            searchFieldBackgroundView.layer.cornerRadius = 4
                        }
                        
                        customeTF = customTextField
                    }
                }
            }
        }
        configureSearchBarUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        customeTF?.frame = CGRect.init(x: 0, y: 0, width: self.width, height: self.height)
        customeTF?.leftView?.frame = CGRect.init(x: (customeTF?.height)!, y: (customeTF?.height)! / 3, width: (customeTF?.height)! / 3, height: (customeTF?.height)! / 3)
    }
}
