//
//  CustomMenuHeaderView.swift
//  TLCTestPrep
//
//  Created by Jeffrey Chang on 6/6/19.
//  Copyright © 2019 Jeffrey Chang. All rights reserved.
//

import UIKit

class CustomMenuHeaderView: UIView {
    // MARK: PROPERTY
    let profileImageView = ProfileImageView()
    
    // MARK: LIFE CYCLE
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        profileImageView.image = #imageLiteral(resourceName: "FuzzyProfileImage")
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 10
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.borderColor = UIColor.white.cgColor
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, paddingTop: 20, paddingLeft: 40, paddingBottom: 30, paddingRight: 50, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
