//
//  MediaTypeSettingViewController.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/15/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

protocol MediaSettingVCDelegate {
    func ituneURLWrapperUpdated(wrapper: ItuneURLWrapper)
}

class MediaSettingViewController: UIViewController {
    
    let viewModel: MediaTypeSettingViewModel
    private var urlString: String?
    var delegate: MediaSettingVCDelegate?
    init(viewModel: MediaTypeSettingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveFilterSetting))
        navigationController?.navigationBar.tintColor = .black
        NotificationCenter.default.addObserver(self, selector: #selector(updateURLComponent(_:)), name: .ituneURLComponentUpdated, object: nil)
        mediaTypeSettingTableView.register(MediaTypeSettingTableViewCell.self, forCellReuseIdentifier: MediaTypeSettingViewModel.cellID)
        view.addSubview(mediaTypeSettingTableView)
        mediaTypeSettingTableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    @objc private func saveFilterSetting() {
        navigationController?.popViewController(animated: true)
        delegate?.ituneURLWrapperUpdated(wrapper: viewModel.ituneURLWrapper)
    }
    
    @objc private func updateURLComponent(_ notification: Notification) {
        guard let mediaTuple = notification.userInfo?[NotificationUserInfoType.mediaTuple] as? (mediaType: MediaType, mediaSetting: MediaSetting, ituneURLComponent: String) else {return}
        viewModel.updateURLWrapper(selectedMediaSetting: mediaTuple.mediaSetting, urlComponentString: mediaTuple.ituneURLComponent)
    }
    
    lazy var mediaTypeSettingTableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.delegate = viewModel
        tv.dataSource = viewModel
        tv.backgroundColor = .black
        return tv
    }()
    
}

enum MediaSetting: String {
    case country = "Country"
    case feedType = "FeedType"
    case genre = "Genre"
    case resultLimit = "Result Limit"
    case allowExplicit = "Allow Explicit"
}

