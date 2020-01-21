//
//  SelfBioViewController.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/20/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

class ComingSoonViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
        menuButton.addTarget(self, action: #selector(openSlideMenu), for: .touchUpInside)
        view.backgroundColor = .black
        view.addSubview(comingSoonLabel)
        comingSoonLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        comingSoonLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        comingSoonLabel.anchor(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 30)
    }
    
    let comingSoonLabel: UILabel = {
        let label = UILabel()
        label.text = "Coming Soon"
        label.textAlignment = .center
        label.textColor = .white
        label.layer.cornerRadius = 10
        label.layer.borderColor = UIColor.white.cgColor
        return label
    }()
    
    @objc private func openSlideMenu() {
        let vc = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController as? BaseSlidingVC
        vc?.openMenu()
    }
}
