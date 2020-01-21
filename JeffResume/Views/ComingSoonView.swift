//
//  ComingSoonView.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/21/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

class ComingSoonView: UIView {
    
    //MARK:- LIFE CYCLE
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        addSubview(comingSoonLabel)
        comingSoonLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        comingSoonLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        comingSoonLabel.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 30)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- UI ELEMENTS
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
    
    let comingSoonLabel: UILabel = {
        let label = UILabel()
        label.text = "Coming Soon"
        label.textAlignment = .center
        label.textColor = .white
        label.layer.cornerRadius = 10
        label.layer.borderColor = UIColor.white.cgColor
        return label
    }()
}
