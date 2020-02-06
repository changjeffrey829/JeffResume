//
//  SelfBioResumeCell.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 2/4/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

class SelfBioResumeCell: UITableViewCell {
    // MARK: - PROPERTY
    var viewModel: SelfBioCellViewModel? {
        didSet {
            guard let viewModel = viewModel else {return}
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM yyyy"
            companyNameLabel.attributedText = viewModel.companyNameAString()
            jobTitleLabel.attributedText = viewModel.jobTitleAString()
            employmentDateLabel.attributedText = viewModel.employmentPeriodAString()
            descriptionLabel.attributedText = viewModel.descriptionAString()
            technologyLabel.attributedText = viewModel.technologyAString()
            if let appStoreAString = viewModel.appStoreLinkAString() {
                appStoreLinkButton.setAttributedTitle(appStoreAString, for: .normal)
                appStoreLinkButton.isHidden = false
            } else {
                appStoreLinkButton.isHidden = true
            }
        }
    }
    
    // MARK: - LIFE CYCLE
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let stackView = UIStackView(arrangedSubviews: [companyNameLabel, jobTitleLabel, employmentDateLabel, descriptionLabel, technologyLabel, appStoreLinkButton])
        stackView.axis = .vertical
        addSubview(stackView)
        stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - OBJC PRIVATE METHOD
    @objc private func openURL() {
        guard let urlString = viewModel?.job.appStoreLink else {return}
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
    
    // MARK: - UI ELEMENTS
    let companyNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Company Name"
        return label
    }()
    
    let jobTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        return label
    }()
    
    let employmentDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Start Date - End Date"
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.numberOfLines = 0
        return label
    }()
    
    let technologyLabel: UILabel = {
        let label = UILabel()
        label.text = "Technology"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var appStoreLinkButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(openURL), for: .touchUpInside)
        return button
    }()
}
