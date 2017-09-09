//
//  HomePageTabbrControllerViewController.swift
//  AirKnow
//
//  Created by 陈超邦 on 2017/9/9.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit
import SwifterSwift
import CHIPageControl

class HomePageTabbrControllerViewController: UITabBarController {

    // MARK: Prompt Button
    lazy var promptButton: UIButton! = {
        var promptButtonInternal: UIButton = UIButton.init()
        promptButtonInternal.theme_setImage(AirKnowConfig.airKnowGlobalTabbarPromptButtonImageStringStyels, forState: .normal)
        return promptButtonInternal
    }()
    
    // MARK: Add Location Button
    lazy var addLoadtionButton: UIButton! = {
        var addLocationButtonInternal = UIButton.init()
        addLocationButtonInternal.theme_setImage(AirKnowConfig.airKnowGlobalTabbarAddLocationButtonImageStringStyels, forState: .normal)
        return addLocationButtonInternal
    }()
    
    // MARK: Page Control
    lazy var pageControl: CHIPageControlJalapeno = {
        var pageControlsInternal: CHIPageControlJalapeno = CHIPageControlJalapeno.init()
        pageControlsInternal.padding = 5
        pageControlsInternal.radius = 3
        pageControlsInternal.theme_tintColor = AirKnowConfig.airKnowGlobalHomePagePCStringStyels
        pageControlsInternal.numberOfPages = 3
        return pageControlsInternal
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Setup Shadows Image
        tabBar.shadowImage = UIImage.init(color: UIColor.clear, size: tabBar.frame.size)
        
        // MARK: Home Page VC
        func setupHomePageViewController() {
            let homePageVC = HomePageViewController()
            homePageVC.pageControl = pageControl
            self.addChildViewController(homePageVC)
        }
        setupHomePageViewController()
        
        // MARK: Setup Theme Color
        self.tabBar.theme_backgroundColor = AirKnowConfig.airKnowGlobalTabbarStringStyles
    }
    
    override func viewDidLayoutSubviews() {
        // MARK: Setup Prompt Button
        func setupPromptButton() {
            self.tabBar.addSubview(promptButton)
            promptButton.snp.makeConstraints { (make) in
                make.left.equalTo(self.tabBar.snp.left).offset(AirKnowConfig.airKnowPromptButtonLeftPadding)
                make.top.equalTo(self.tabBar.snp.top).offset(AirKnowConfig.airKnowPromptButtonTopPadding)
                make.height.equalTo(AirKnowConfig.airKnowPromptButtonHeight)
                make.height.equalTo(promptButton.snp.width)
            }
        }
        setupPromptButton()
        
        // MARK: Add Location Button
        func setupAddLocationButton() {
            self.tabBar.addSubview(addLoadtionButton)
            addLoadtionButton.snp.makeConstraints { (make) in
                make.right.equalTo(self.tabBar.snp.right).offset(AirKnowConfig.airKnowAddLocationButtonRightPadding)
                make.top.equalTo(self.tabBar.snp.top).offset(AirKnowConfig.airKnowAddLocationButtonTopPadding)
                make.height.equalTo(AirKnowConfig.airKnowAddLocationButtonHeight)
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
