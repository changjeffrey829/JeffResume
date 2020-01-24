//
//  BaseSlidingVC.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/10/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

class BaseSlidingController: UIViewController {
    
    //MARK:- PROPERTIES
    let baseSlidingView: BaseSlidingView
    var viewModel: BaseSlidingViewModel
    var centerViewController: UIViewController
    let menuController: MenuController
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return viewModel.isMenuOpened ? .lightContent : .default
    }
    
    init(viewModel: BaseSlidingViewModel) {
        self.viewModel = viewModel
        self.centerViewController = BaseSlidingController.showDefaultViewController()
        self.menuController = MenuController(viewModel: MenuViewModel())
        baseSlidingView = BaseSlidingView(frame: .zero, menuWidth: viewModel.menuWidth, centerCoverView: centerViewController.view ?? UIView(), sideCoverView: menuController.view ?? UIView())
        super.init(nibName: nil, bundle: nil)
        
    }
    
    //MARK:- LIFE CYCLE
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = baseSlidingView
        view.backgroundColor = .white
        
        setupViewControllers()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapDismiss))
        baseSlidingView.darkCoverView.addGestureRecognizer(tapGesture)
    }
    
    
    //MARK:- OBJC PRIVATE METHOD
    @objc private func handleTapDismiss() {
        closeMenu()
    }
    
    @objc private func handlePan(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        let x = viewModel.panGestureXCalculation(x: translation.x)
        baseSlidingView.centerViewLeadingConstraint.constant = x
        baseSlidingView.centerViewTrailingConstraint.constant = x
        baseSlidingView.darkCoverView.alpha = x / viewModel.menuWidth
        
        if gesture.state == .ended {
            handleEnded(gesture: gesture)
        }
    }
    
    //MARK:- PRIVATE STATIC METHOD
    static private func showDefaultViewController() -> UIViewController {
        let vc = ComingSoonController()
        return UINavigationController(rootViewController: vc)
    }
    
    //MARK:- PRIVATE METHOD
    private func handleEnded(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        let velocity = gesture.velocity(in: view)
        let shouldOpenMenu = viewModel.shouldOpenMenu(translation: translation, velocity: velocity)
        if shouldOpenMenu {
            openMenu()
        } else {
            closeMenu()
        }
    }
    
    private func performRightViewCleanUp() {
        centerViewController.view.removeFromSuperview()
        centerViewController.removeFromParent()
    }
    
    private func performAnimations() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            self.baseSlidingView.darkCoverView.alpha = self.viewModel.isMenuOpened ? 1 : 0
        })
    }
    
    private func setupViewControllers() {
        addChild(centerViewController)
        addChild(menuController)
    }
    
    //MARK:- PUBLIC METHOD
    func openMenu() {
        viewModel.isMenuOpened = true
        baseSlidingView.centerViewLeadingConstraint.constant = viewModel.menuWidth
        baseSlidingView.centerViewTrailingConstraint.constant = viewModel.menuWidth
        performAnimations()
        setNeedsStatusBarAppearanceUpdate()
    }
    
    func closeMenu() {
        baseSlidingView.centerViewLeadingConstraint.constant = 0
        baseSlidingView.centerViewTrailingConstraint.constant = 0
        viewModel.isMenuOpened = false
        performAnimations()
        setNeedsStatusBarAppearanceUpdate()
    }
    
    
    
    func didSelectMenuItem(index: Int) {
        closeMenu()
        switch index {
        case 0:
            performRightViewCleanUp()
            let vc = ComingSoonController()
            centerViewController = UINavigationController(rootViewController: vc)
        case 1:
            performRightViewCleanUp()
            let vm = NestedViewModel(mediaTypes: [.movies, .podcasts, .audiobooks])
            let homeController = NestedViewTabController(viewModel: vm)
            centerViewController = UINavigationController(rootViewController: homeController)
        case 2:
            performRightViewCleanUp()
            let vc = ComingSoonController()
            centerViewController = UINavigationController(rootViewController: vc)
        case 3:
            performRightViewCleanUp()
            
            let vc = ComingSoonController()
            centerViewController = UINavigationController(rootViewController: vc)
        case 4:
            performRightViewCleanUp()
            let vc = ComingSoonController()
            centerViewController = UINavigationController(rootViewController: vc)
        default:
            break
        }
        
        baseSlidingView.centerView.addSubview(centerViewController.view)
        addChild(centerViewController)
        
        baseSlidingView.centerView.bringSubviewToFront(baseSlidingView.darkCoverView)
    }
}
