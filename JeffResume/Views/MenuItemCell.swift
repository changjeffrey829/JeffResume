//
//  MenuItemCell.swift
//  TLCTestPrep
//
//  Created by Jeffrey Chang on 6/6/19.
//  Copyright © 2019 Jeffrey Chang. All rights reserved.
//

import UIKit

class IconImageView: UIImageView {
    override var intrinsicContentSize: CGSize {
        return .init(width: 44, height: 44)
    }
}

class MenuItemCell: UITableViewCell {
    
    let iconImageView: IconImageView = {
        let iv = IconImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = #imageLiteral(resourceName: "FuzzyProfileImage")
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        let stackView = UIStackView(arrangedSubviews: [titleLabel])
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 12
        let localizedString = NSLocalizedString("profile", comment: "Profile")
        titleLabel.text = localizedString
        
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 8, left: 12, bottom: 8, right: 12)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
