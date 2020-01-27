//
//  MediaTypeSettingTableViewCell.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/17/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

class MediaTypeSettingTableViewCell: UITableViewCell {
    
    var viewModel: MediaTypeSettingCellViewModel? {
        didSet {
            titleLabel.text = viewModel?.mediaSetting.rawValue
            pickerView.delegate = viewModel
            pickerView.dataSource = viewModel
            pickerView.reloadAllComponents()
            pickerView.selectRow(viewModel?.currentIndex ?? 0, inComponent: 0, animated: true)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleLabel)
        addSubview(pickerView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .black
        titleLabel.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: frame.height / 3)
        pickerView.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "title"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView(frame: .zero)
        pickerView.backgroundColor = .black
        return pickerView
    }()
}
