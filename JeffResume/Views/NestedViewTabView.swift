//
//  NestedViewTabView.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/21/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

class NestedViewTabView: UIView {
    // MARK: - LIFE CYCLE
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mainTableView)
        mainTableView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI ELEMENTS
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
    
    lazy var mainTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .black
        return tableView
    }()
}
