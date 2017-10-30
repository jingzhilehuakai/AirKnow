//
//  SearchViewController.swift
//  AirKnow
//
//  Created by 王净 on 2017/10/17.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit
import SwiftTheme
import IGListKit

class SearchViewController: UIViewController {
    
    var listData: Array<AirQualitySearchResultModel>? = []
    var allowResignKB = false;
    
    lazy var dismissAreaView: UIView = {
        let dismissAreaViewInternal = UIView()
        return dismissAreaViewInternal
    }()
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    lazy var splitLine: UIView = {
        let splitLineInternal = UIView()
        splitLineInternal.backgroundColor = UIColor.lightGray
        splitLineInternal.alpha = 0.3
        return splitLineInternal
    }()
    
    lazy var workingAreaView: UIVisualEffectView = {
        let style = ThemeManager.currentThemeIndex == 0 ? UIBlurEffectStyle.extraLight : UIBlurEffectStyle.light
        let effect = UIBlurEffect(style: style)
        let workingAreaViewInternal = UIVisualEffectView.init(effect: effect)
        workingAreaViewInternal.layer.cornerRadius = 2.5
        workingAreaViewInternal.alpha = 0.98
        workingAreaViewInternal.borderWidth = 0.5
        workingAreaViewInternal.borderColor = UIColor.lightGray.withAlphaComponent(0.5)
        workingAreaViewInternal.clipsToBounds = true
        return workingAreaViewInternal
    }()

    lazy var searchBar: AirKnowSearchBar = {
        let searchBarInternal = AirKnowSearchBar()
        searchBarInternal.backgroundColor = UIColor.clear
        searchBarInternal.theme_tintColor = AirKnowConfig.tabbarStyles
        searchBarInternal.delegate = self
        return searchBarInternal
    }()
    
    // MARK: CollectionView
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionViewInternal = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionViewInternal.backgroundColor = UIColor.clear
        if #available(iOS 10.0, *) {
            collectionViewInternal.isPrefetchingEnabled = false
        }
        return collectionViewInternal
    }()
    
    func dismissAction(_ button:UIButton?) {
        dismiss(animated: true, completion: nil)
        UIApplication.shared.sendAction(#selector(TabbarController.maximizeView(_:)), to: nil, from: self, for: nil)
    }
    
    func keybordResignFirstResponder() {
        if searchBar.canResignFirstResponder {
            searchBar.resignFirstResponder()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adapter.collectionView = collectionView
        adapter.dataSource = self
        adapter.scrollViewDelegate = self

        func setupSubviews() {
            self.view.addSubview(dismissAreaView)
            dismissAreaView.snp.makeConstraints { (make) in
                make.left.equalTo(self.view)
                make.right.equalTo(self.view)
                make.bottom.equalTo(self.view).offset(-AirKnowConfig.searchVCHeight)
                make.top.equalTo(self.view)
            }
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissAction(_:)))
            dismissAreaView.addGestureRecognizer(tapGesture)
            
            self.view.addSubview(workingAreaView)
            workingAreaView.snp.makeConstraints { (make) in
                make.left.equalTo(self.view)
                make.right.equalTo(self.view)
                make.bottom.equalTo(self.view)
                make.top.equalTo(self.view).offset(self.view.frame.size.height - AirKnowConfig.searchVCHeight)
            }
            let keybordTapGesture = UITapGestureRecognizer(target: self, action: #selector(keybordResignFirstResponder))
            workingAreaView.addGestureRecognizer(keybordTapGesture)
            
            self.view.addSubview(searchBar)
            searchBar.snp.makeConstraints { (make) in
                make.left.equalTo(self.workingAreaView).offset(AirKnowConfig.searchBarLeftPadding)
                make.right.equalTo(self.workingAreaView).offset(AirKnowConfig.searchBarRightPadding)
                make.top.equalTo(self.workingAreaView).offset(AirKnowConfig.searchBarTopPadding)
                make.height.equalTo(AirKnowConfig.searchBarHeight)
            }
            
            self.view.addSubview(splitLine)
            splitLine.snp.makeConstraints { (make) in
                make.left.right.equalTo(self.view)
                make.top.equalTo(searchBar.snp.bottom).offset(AirKnowConfig.searchBarTopPadding)
                make.height.equalTo(0.5)
            }
            
            self.view.addSubview(collectionView)
            collectionView.snp.makeConstraints { (make) in
                make.top.equalTo(splitLine)
                make.left.right.equalTo(self.view)
                make.bottom.equalTo(self.view)
            }
        }
        setupSubviews()
        
        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.sendAction(#selector(TabbarController.minimizeView(_:)), to: nil, from: self, for: nil)
        searchBar.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SearchViewController: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return listData != nil ? listData! : []
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        let searchVC = SearchViewControllerSC()
        searchVC.didSelectItem = { (index: Int) -> Void in
            self.dismissAction(nil)
        }
        return searchVC
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}

extension SearchViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if allowResignKB && searchBar.canResignFirstResponder {
            searchBar.resignFirstResponder()
            allowResignKB = false
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        allowResignKB = true
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        LocationSearchService.cancleAllPreAPIs()
        LocationSearchService.search(locationStr: searchText) { (models, error) in
            self.listData = models
            self.adapter.reloadData(completion: nil)
        }
    }
}
