//
//  HomePageTabbarControllerViewController.swift
//  AirKnow
//
//  Created by 陈超邦 on 2017/9/9.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit
import SwifterSwift
import SwiftTheme
import CHIPageControl
import Spring
import MBProgressHUD
import SCLAlertView

class TabbarController: UITabBarController {

    var originStatusStyle: UIStatusBarStyle?
    
    // MARK: Prompt Button
    lazy var promptButton: AirKnowExpandTouchPointButton! = {
        var promptButtonInternal: AirKnowExpandTouchPointButton = AirKnowExpandTouchPointButton.init()
        promptButtonInternal.theme_setImage(AirKnowConfig.promptButtonImageStyles, forState: .normal)
        promptButtonInternal.addTarget(self, action:#selector(themeSwitch(_:)), for:.touchUpInside)
        return promptButtonInternal
    }()
    
    var homePageVC: HomePageViewController!

    func themeSwitch(_ button:UIButton){
        switch ThemeManager.currentThemeIndex {
        case 0:
            ThemeManager.setTheme(index: AirKnowConfig.airKnowTheme.dark.rawValue)
        default:
            ThemeManager.setTheme(index: AirKnowConfig.airKnowTheme.light.rawValue)
        }
    }
    
    var alertController: SCLAlertView {
        let appearance = SCLAlertView.SCLAppearance.init(kTitleTop: 50, showCloseButton: false, showCircularIcon: false, hideWhenBackgroundViewIsTapped: true)
        let alert = SCLAlertView(appearance: appearance)
        if AirKnowLocationManager.sharedInstance.currentMonitorLocationNumber() > 0 {
            alert.addButton("DELETE", backgroundColor: UIColor.red.withAlphaComponent(0.7)) {
                AirKnowLocationManager.sharedInstance.removeALocatona(at: (self.homePageVC.pageControl?.currentPage)!)
                self.homePageVC.adapter.reloadData(completion: { (bool) in
                    self.homePageVC.pageControl!.progress = 0
                    self.homePageVC.collectionView.setContentOffset(CGPoint.zero, animated: false)
                })
            }
            alert.addButton("UPDATE") {
                NotificationCenter.default.post(name: NSNotification.Name("shartLocationUpdateNotification"), object: self, userInfo: nil)
                AirKnowLocationManager.sharedInstance.updateLocation(at: (self.homePageVC.pageControl?.currentPage)!, completetion: {
                    NotificationCenter.default.post(name: NSNotification.Name("finishLocationUpdateNotification"), object: self, userInfo: nil)
                })
            }
        }
        
        alert.addButton("ADD") {
            DispatchQueue.main.async {
                let searchVC = SearchViewController()
                searchVC.isModalInPopover = true
                searchVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
                self.present(searchVC, animated: true, completion: nil)
            }
        }
        return alert
    }
    
    func minimizeView(_ sender: AnyObject) {
        SpringAnimation.spring(duration: 0.7, animations: {
            self.homePageVC.view.transform = CGAffineTransform(scaleX: 0.935, y: 0.935)
        })
        originStatusStyle = UIApplication.shared.statusBarStyle
        UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.lightContent, animated: true)
    }
    
    func maximizeView(_ sender: AnyObject) {
        SpringAnimation.spring(duration: 0.7, animations: {
            self.homePageVC.view.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
        if originStatusStyle != nil {
            UIApplication.shared.setStatusBarStyle(originStatusStyle!, animated: true)
        }
    }
    
    // MARK: Add Location Button
    lazy var addLocationButton: AirKnowExpandTouchPointButton! = {
        var addLocationButtonInternal = AirKnowExpandTouchPointButton.init()
        addLocationButtonInternal.addTarget(self, action:#selector(addLocation(_:)) , for: .touchUpInside)
        addLocationButtonInternal.theme_setImage(AirKnowConfig.addLocationButtonImageStyles, forState: .normal)
        return addLocationButtonInternal
    }()
    
    func addLocation(_ button:UIButton) {
        let subTitleInternal = AirKnowLocationManager.sharedInstance.currentMonitorLocationNumber() > 0 ? "'DELETE' to remove current location page, 'UPDATE' to update air quality information of current location, 'ADD' to add a new location" : "'ADD' to add a new location"
        self.alertController.showSuccess("CHOOSE", subTitle: subTitleInternal, animationStyle: SCLAnimationStyle.noAnimation)
    }
    
    // MARK: Page Control
    lazy var pageControl: CHIPageControlJalapeno = {
        var pageControlsInternal: CHIPageControlJalapeno = CHIPageControlJalapeno.init()
        pageControlsInternal.padding = 5
        pageControlsInternal.radius = 3
        pageControlsInternal.theme_tintColor = AirKnowConfig.homePagePageControllerStyles
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
            self.tabBar.addSubview(addLocationButton)
            addLocationButton.snp.makeConstraints { (make) in
                make.right.equalTo(self.tabBar.snp.right).offset(AirKnowConfig.addLocationButtonRightPadding)
                make.top.equalTo(self.tabBar.snp.top).offset(AirKnowConfig.addLocationButtonTopPadding)
                make.height.equalTo(AirKnowConfig.addLocationButtonHeight)
                make.height.equalTo(addLocationButton.snp.width)
            }
        }
        setupAddLocationButton()
        
        // MARK: Add Page Control
        func setupPageControl() {
            self.tabBar.addSubview(pageControl)
            pageControl.snp.makeConstraints { (make) in
                make.left.equalTo(promptButton.snp.right)
                make.right.equalTo(addLocationButton.snp.left)
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
            homePageVC = HomePageViewController()
            homePageVC.pageControl = pageControl
            self.addChildViewController(homePageVC)
        }
        setupHomePageViewController()
        
        super.viewDidLoad()
        
        // MARK: Setup Theme Color
        self.tabBar.theme_backgroundColor = AirKnowConfig.tabbarStyles
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
