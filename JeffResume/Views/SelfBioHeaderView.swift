//
//  SelfBioHeaderView.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 2/5/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

class SelfBioHeaderView: UIView {
    // MARK: - LIFE CYCLE
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(categoryLabel)
        categoryLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI ELEMENT
    let categoryLabel: UILabel = {
        let label = UILabel()
        return label
    }()
}
