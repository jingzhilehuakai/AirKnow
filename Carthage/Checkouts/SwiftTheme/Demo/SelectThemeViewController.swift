//
//  SelectThemeViewController.swift
//  Demo
//
//  Created by Gesen on 16/3/1.
//  Copyright © 2016年 Gesen. All rights reserved.
//

import UIKit

class SelectThemeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.theme_backgroundColor = globalBackgroundColorPicker
    }
    
    @IBAction @objc(tapRed:) func tapRed(_ sender: AnyObject) {
        MyThemes.switchTo(theme: .Red)
    }
    
    @IBAction @objc func tapYellow(_ sender: AnyObject) {
        MyThemes.switchTo(theme: .Yello)
    }
    
    @IBAction func tapBlue(_ sender: AnyObject) {
        MyThemes.switchTo(theme: .Blue)
    }

}
