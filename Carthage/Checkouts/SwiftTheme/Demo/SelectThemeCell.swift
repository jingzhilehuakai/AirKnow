//
//  SelectThemeCell.swift
//  Demo
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
        
        title.theme_textColor = globalTextColorPicker
        themeIcon.theme_image = ["icon_theme_red", "icon_theme_yellow", "icon_theme_blue", "icon_theme_light"]
    }

}
