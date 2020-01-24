//
//  ViewController.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/10/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

class NestedViewTabController: UIViewController {
    
    //MARK:- PROPERTIES
    var viewModel: NestedViewModel
    var mainView = NestedViewTabView()
    
    //MARK:- LIFE CYCLE
    init(viewModel: NestedViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        mainView.menuButton.addTarget(self, action: #selector(openSlideMenu), for: .touchUpInside)
        mainView.mainTableView.delegate = viewModel
        mainView.mainTableView.dataSource = viewModel
        mainView.mainTableView.register(NestedTableViewCell.self, forCellReuseIdentifier: viewModel.cellID)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: mainView.menuButton)
        NotificationCenter.default.addObserver(self, selector: #selector(openFilterView), name: .filterButtonTapped, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let index = viewModel.tableViewIndexRequireUpdate else {return}
        self.mainView.mainTableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
        viewModel.tableViewIndexRequireUpdate = nil
    }
    
    //MARK:- OBJC METHODS
    @objc private func openSlideMenu() {
        let vc = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController as? BaseSlidingController
        vc?.openMenu()
    }
    
    @objc private func openFilterView(_ notification: Notification) {
        guard
            let mediaType = notification.userInfo?[NotificationUserInfoType.filterButton.rawValue] as? MediaType,
            let ituneURLWrapper = viewModel.ituneURLWrappersDict[mediaType]
        else {return}
        
        let vm = MediaTypeSettingViewModel(mediaType: mediaType, mediaSettingDatasource: [.country, .feedType, .genre, .resultLimit, .allowExplicit], ituneURLWrapper: ituneURLWrapper)
        let vc = MediaSettingController(viewModel: vm)
        vc.delegate = viewModel
        navigationController?.pushViewController(vc, animated: true)
    }
}
