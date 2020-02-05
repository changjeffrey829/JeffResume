//
//  SelfBioController.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/25/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

class SelfBioController: UIViewController {
    // MARK: - PROPERTIES
    let selfBioView = SelfBioView()
    let viewModel: SelfBioViewModel
    
    // MARK: - LIFE CYCLE
    init(viewModel: SelfBioViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setupTableView()
        selfBioView.selfBioTextView.attributedText = viewModel.selfBioAString()
        selfBioView.segmentedControl.addTarget(self, action: #selector(switchView), for: .valueChanged)
        selfBioView.menuButton.addTarget(self, action: #selector(openSlideMenu), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: selfBioView.menuButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = selfBioView
    }
    
    // MARK: - PRIVATE METHOD
    private func setupTableView() {
        selfBioView.tableView.delegate = viewModel
        selfBioView.tableView.dataSource = viewModel
        selfBioView.tableView.register(SelfBioResumeCell.self, forCellReuseIdentifier: SelfBioViewModel.cellID)
    }
    
    private func genericTransition(from fromView: UIView, to toView: UIView) {
        let transitionOptions: UIView.AnimationOptions = [
            .transitionFlipFromRight,
            .showHideTransitionViews
        ]
        UIView.transition(with: fromView, duration: 0.5, options: transitionOptions, animations: {
            toView.isHidden = false
        })
        
        UIView.transition(with: toView, duration: 0.5, options: transitionOptions, animations: {
            fromView.isHidden = true
        })
    }
    
    // MARK: - OBJC PRIVATE METHOD
    @objc private func openSlideMenu() {
        NotificationCenter.default.post(name: .showSlideMenu, object: nil)
    }
    
    @objc private func switchView() {
        if selfBioView.segmentedControl.selectedSegmentIndex == 0 {
            genericTransition(from: selfBioView.tableView, to: selfBioView.selfBioTextView)
        } else {
            genericTransition(from: selfBioView.selfBioTextView, to: selfBioView.tableView)
        }
    }
}
