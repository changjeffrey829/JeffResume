//
//  MediaSettingView.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/21/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

class MediaSettingView: UIView {
    // MARK: - LIFE CYCLE
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mediaTypeSettingTableView)
        mediaTypeSettingTableView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI ELEMENT
    lazy var mediaTypeSettingTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .black
        return tableView
    }()
}
