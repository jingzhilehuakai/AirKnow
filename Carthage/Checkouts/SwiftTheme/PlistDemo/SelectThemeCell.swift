//
//  SelectThemeCell.swift
//  PlistDemo
//
//  Created by Gesen on 16/3/2.
//  Copyright © 2016年 Gesen. All rights reserved.
//

import UIKit

class SelectThemeCell: BaseCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var themeIcon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        title.theme_textColor = "Global.textColor"
        themeIcon.theme_image = "SelectThemeCell.iconImage"
    }

}
