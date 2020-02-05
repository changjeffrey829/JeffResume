//
//  SelfBioView.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 2/3/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

class SelfBioView: UIView {
    // MARK: - LIFE CYCLE
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        addSubview(segmentedControl)
        segmentedControl.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        addSubview(selfBioTextView)
        selfBioTextView.anchor(top: segmentedControl.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 0)
        addSubview(tableView)
        tableView.anchor(top: segmentedControl.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI ELEMENTS
    let menuButton: UIButton = {
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
    
    let segmentedControl: UISegmentedControl = {
        let segementControll = UISegmentedControl(items: ["Bio", "Resume"])
        segementControll.translatesAutoresizingMaskIntoConstraints = false
        segementControll.selectedSegmentIndex = 0
        segementControll.backgroundColor = .gray
        segementControll.tintColor = .brown
        return segementControll
    }()
    
    let selfBioTextView: UITextView = {
        let textView = UITextView(frame: .zero)
        let text = "Self Bio..."
        textView.text = text
        textView.isEditable = false
        textView.isSelectable = true
        return textView
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.isHidden = true
        return tableView
    }()
}
