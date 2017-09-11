//
//  HomePageTabbrControllerViewController.swift
//  AirKnow
//
//  Created by 陈超邦 on 2017/9/9.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit
import SwifterSwift
import SwiftTheme
import CHIPageControl

class TabbrController: UITabBarController {

    // MARK: Prompt Button
    lazy var promptButton: UIButton! = {
        var promptButtonInternal: UIButton = UIButton.init()
        promptButtonInternal.theme_setImage(AirKnowConfig.promptButtonImageStringStyels, forState: .normal)
        
        promptButtonInternal.addTarget(self, action:#selector(tapped(_:)), for:.touchUpInside)

        return promptButtonInternal
    }()
    
    func tapped(_ button:UIButton){
        switch ThemeManager.currentThemeIndex {
        case 0:
            ThemeManager.setTheme(index: AirKnowConfig.airKnowTheme.dark.rawValue)
        default:
            ThemeManager.setTheme(index: AirKnowConfig.airKnowTheme.light.rawValue)
        }
    }
    
    // MARK: Add Location Button
    lazy var addLoadtionButton: UIButton! = {
        var addLocationButtonInternal = UIButton.init()
        addLocationButtonInternal.theme_setImage(AirKnowConfig.addLocationButtonImageStringStyels, forState: .normal)
        return addLocationButtonInternal
    }()
    
    // MARK: Page Control
    lazy var pageControl: CHIPageControlJalapeno = {
        var pageControlsInternal: CHIPageControlJalapeno = CHIPageControlJalapeno.init()
        pageControlsInternal.padding = 5
        pageControlsInternal.radius = 3
        pageControlsInternal.theme_tintColor = AirKnowConfig.homePagePageControllerStringStyels
        pageControlsInternal.numberOfPages = 3
        return pageControlsInternal
    }()
    
    // Layout Views
    func layoutViews() {
        // MARK: Setup Prompt Button
        func setupPromptButton() {
            self.tabBar.addSubview(promptButton)
            promptButton.snp.makeConstraints { (make) in
                make.left.equalTo(self.tabBar.snp.left).offset(AirKnowConfig.promptButtonLeftPadding)
                make.top.equalTo(self.tabBar.snp.top).offset(AirKnowConfig.promptButtonTopPadding)
                make.height.equalTo(AirKnowConfig.promptButtonHeight)
                make.height.equalTo(promptButton.snp.width)
            }
        }
        setupPromptButton()
        
        // MARK: Add Location Button
        func setupAddLocationButton() {
            self.tabBar.addSubview(addLoadtionButton)
            addLoadtionButton.snp.makeConstraints { (make) in
                make.right.equalTo(self.tabBar.snp.right).offset(AirKnowConfig.addLocationButtonRightPadding)
                make.top.equalTo(self.tabBar.snp.top).offset(AirKnowConfig.addLocationButtonTopPadding)
                make.height.equalTo(AirKnowConfig.addLocationButtonHeight)
                make.height.equalTo(addLoadtionButton.snp.width)
            }
        }
        setupAddLocationButton()
        
        // MARK: Add Page Control
        func setupPageControl() {
            self.tabBar.addSubview(pageControl)
            pageControl.snp.makeConstraints { (make) in
                make.left.equalTo(promptButton.snp.right)
                make.right.equalTo(addLoadtionButton.snp.left)
                make.height.equalTo(promptButton.snp.width).multipliedBy(0.5)
                make.center.equalTo(tabBar.snp.center)
            }
        }
        setupPageControl()
    }
    
    override func viewDidLoad() {
        
        // Setup Shadows Image
        tabBar.shadowImage = UIImage.init(color: UIColor.clear, size: tabBar.frame.size)
        
        // MARK: Home Page VC
        func setupHomePageViewController() {
            let homePageVC = HomePageViewController()
            homePageVC.pageControl = pageControl
            self.addChildViewController(homePageVC)
        }
        setupHomePageViewController()
        
        super.viewDidLoad()
        
        // MARK: Setup Theme Color
        self.tabBar.theme_backgroundColor = AirKnowConfig.tabbarStringStyles
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutViews()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
