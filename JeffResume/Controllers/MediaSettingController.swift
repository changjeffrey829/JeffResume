//
//  MediaTypeSettingViewController.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/15/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

protocol MediaSettingVCDelegate: AnyObject {
    func ituneURLWrapperUpdated(wrapper: ItuneURLWrapper)
}

class MediaSettingController: UIViewController {
    
    // MARK: - PROPERTIES
    let viewModel: MediaTypeSettingViewModel
    let mainView = MediaSettingView()
    weak var delegate: MediaSettingVCDelegate?
    
    // MARK: - LIFE CYCLE
    init(viewModel: MediaTypeSettingViewModel) {
        self.viewModel = viewModel
        mainView.mediaTypeSettingTableView.delegate = viewModel
        mainView.mediaTypeSettingTableView.dataSource = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveFilterSetting))
        navigationController?.navigationBar.tintColor = .white
        NotificationCenter.default.addObserver(self, selector: #selector(updateURLComponent(_:)), name: .ituneURLComponentUpdated, object: nil)
        mainView.mediaTypeSettingTableView.register(MediaTypeSettingTableViewCell.self, forCellReuseIdentifier: MediaTypeSettingViewModel.cellID)
    }
    
    // MARK: - OBJC PRIVATE METHODS
    @objc private func saveFilterSetting() {
        navigationController?.popViewController(animated: true)
        delegate?.ituneURLWrapperUpdated(wrapper: viewModel.ituneURLWrapper)
    }
    
    @objc private func updateURLComponent(_ notification: Notification) {
        guard let mediaTuple = notification.userInfo?[NotificationUserInfoType.mediaTuple] as? (mediaType: MediaType, mediaSetting: MediaSetting, ituneURLComponent: String) else {return}
        viewModel.updateURLWrapper(selectedMediaSetting: mediaTuple.mediaSetting, urlComponentString: mediaTuple.ituneURLComponent)
    }
}
