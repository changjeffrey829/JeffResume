//
//  ViewController.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/10/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

class NestedViewController: UIViewController {
    
    var viewModel: NestedViewModel
    
    init(viewModel: NestedViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var menuButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "FuzzyProfileImage"), for: .normal)
        button.imageView?.contentMode = UIView.ContentMode.scaleAspectFill
        button.clipsToBounds = true
        button.layer.cornerRadius = 40 / 2
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
        menuButton.addTarget(self, action: #selector(openSlideMenu), for: .touchUpInside)
        view.addSubview(mainTableView)
        mainTableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        NotificationCenter.default.addObserver(self, selector: #selector(openFilterView), name: .filterButtonTapped, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let index = viewModel.tableViewIndexRequireUpdate else {return}
        self.mainTableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
        viewModel.tableViewIndexRequireUpdate = nil
    }
    
    @objc private func openSlideMenu() {
        let vc = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController as? BaseSlidingVC
        vc?.openMenu()
    }
    
    @objc private func openFilterView(_ notification: Notification) {
        guard
            let mediaType = notification.userInfo?[NotificationUserInfoType.filterButton.rawValue] as? MediaType,
            let ituneURLWrapper = viewModel.ituneURLWrappersDict[mediaType]
        else {return}
        
        let vm = MediaTypeSettingViewModel(mediaType: mediaType, mediaSettingDatasource: [.country, .feedType, .genre, .resultLimit, .allowExplicit], ituneURLWrapper: ituneURLWrapper)
        let vc = MediaSettingViewController(viewModel: vm)
        vc.delegate = viewModel
        navigationController?.pushViewController(vc, animated: true)
    }
    
    lazy var mainTableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.delegate = viewModel
        tv.dataSource = viewModel
        tv.register(NestedTableViewCell.self, forCellReuseIdentifier: viewModel.cellID)
        tv.backgroundColor = .black
        return tv
    }()
}
