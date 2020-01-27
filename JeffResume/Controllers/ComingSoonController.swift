//
//  SelfBioViewController.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/20/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

class ComingSoonController: UIViewController {
    
    // MARK: - PROPERTY
    let mainView = ComingSoonView()
    
    // MARK: - LIFE CYCLE
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: mainView.menuButton)
        mainView.menuButton.addTarget(self, action: #selector(openSlideMenu), for: .touchUpInside)
        
    }
    
    // MARK: - OBJC PRIVATE METHOD
    @objc private func openSlideMenu() {
        NotificationCenter.default.post(name: .showSlideMenu, object: nil)
    }
}
