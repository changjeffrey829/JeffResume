//
//  SelfBioEduCell.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 2/5/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

class SelfBioEduCell: UITableViewCell {
    // MARK: - PROPERTY
    var viewModel: SelfBioEduCellViewModel? {
        didSet {
            schoolNameLabel.attributedText = viewModel?.schoolNameAString()
            dateLabel.attributedText = viewModel?.dateAString()
            majorLabel.attributedText = viewModel?.majorAString()
        }
    }
    
    // MARK: - LIFE CYCLE
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let stackView = UIStackView(arrangedSubviews: [schoolNameLabel, dateLabel, majorLabel])
        stackView.axis = .vertical
        addSubview(stackView)
        stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI ELEMENTS
    let schoolNameLabel: UILabel = {
        let label = UILabel()
        label.text = "School Name"
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "yyyy to yyyy"
        return label
    }()
    
    let majorLabel: UILabel = {
        let label = UILabel()
        label.text = "Major"
        return label
    }()
}
