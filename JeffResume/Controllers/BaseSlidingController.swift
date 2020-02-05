//
//  BaseSlidingVC.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/10/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

protocol BaseSlidingControllerDelegate: AnyObject {
    func didSelectMenuItem(index: Int)
}

class BaseSlidingController: UIViewController {
    // MARK: - PROPERTIES
    let baseSlidingView: BaseSlidingView
    var viewModel: BaseSlidingViewModel
    var centerViewController: UIViewController
    let leftViewController: MenuController
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return viewModel.isMenuOpened ? .lightContent : .default
    }
    
    init(viewModel: BaseSlidingViewModel) {
        self.viewModel = viewModel
        self.centerViewController = BaseSlidingController.showDefaultViewController()
        self.leftViewController = MenuController(viewModel: MenuViewModel())
        baseSlidingView = BaseSlidingView(frame: .zero, menuWidth: viewModel.menuWidth, centerCoverView: centerViewController.view ?? UIView(), sideCoverView: leftViewController.view ?? UIView())
        super.init(nibName: nil, bundle: nil)
        self.leftViewController.viewModel.delegate = self
    }
    
    // MARK: - LIFE CYCLE
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = baseSlidingView
        view.backgroundColor = .white
        NotificationCenter.default.addObserver(self, selector: #selector(handleShowMenu), name: .showSlideMenu, object: nil)
        setupViewControllers()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapDismiss))
        baseSlidingView.darkCoverView.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - OBJC PRIVATE METHOD
    @objc private func handleTapDismiss() {
        closeMenu()
    }
    
    @objc private func handleShowMenu() {
        openMenu()
    }
    
    @objc private func handlePan(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        let transX = viewModel.panGestureXCalculation(gestureTranslationX: translation.x)
        baseSlidingView.centerViewLeadingConstraint.constant = transX
        baseSlidingView.centerViewTrailingConstraint.constant = transX
        baseSlidingView.darkCoverView.alpha = transX / viewModel.menuWidth
        
        if gesture.state == .ended {
            handleEnded(gesture: gesture)
        }
    }
    
    // MARK: - PRIVATE STATIC METHOD
    static private func showDefaultViewController() -> UIViewController {
        let selfBioViewModel = SelfBioViewModel()
        let viewController = SelfBioController(viewModel: selfBioViewModel)
        return UINavigationController(rootViewController: viewController)
    }
    
    // MARK: - PRIVATE METHOD
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
    
    private func performCenterViewCleanUp() {
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
        addChild(leftViewController)
    }
    
    private func closeMenu() {
        baseSlidingView.centerViewLeadingConstraint.constant = 0
        baseSlidingView.centerViewTrailingConstraint.constant = 0
        viewModel.isMenuOpened = false
        performAnimations()
        setNeedsStatusBarAppearanceUpdate()
    }
    
    // MARK: - PUBLIC METHOD
    func openMenu() {
        viewModel.isMenuOpened = true
        baseSlidingView.centerViewLeadingConstraint.constant = viewModel.menuWidth
        baseSlidingView.centerViewTrailingConstraint.constant = viewModel.menuWidth
        performAnimations()
        setNeedsStatusBarAppearanceUpdate()
    }
     
}

extension BaseSlidingController: BaseSlidingControllerDelegate {
    func didSelectMenuItem(index: Int) {
        closeMenu()
        switch index {
        case 0:
            performCenterViewCleanUp()
            let selfBioViewModel = SelfBioViewModel()
            let viewController = SelfBioController(viewModel: selfBioViewModel)
            centerViewController = UINavigationController(rootViewController: viewController)
        case 1:
            performCenterViewCleanUp()
            let viewModel = NestedViewModel(mediaTypes: [.movies, .podcasts, .audiobooks])
            let homeController = NestedTableDemoController(viewModel: viewModel)
            centerViewController = UINavigationController(rootViewController: homeController)
        case 2:
            performCenterViewCleanUp()
            let viewController = ComingSoonController()
            centerViewController = UINavigationController(rootViewController: viewController)
        case 3:
            performCenterViewCleanUp()
            
            let viewController = ComingSoonController()
            centerViewController = UINavigationController(rootViewController: viewController)
        case 4:
            performCenterViewCleanUp()
            let viewController = ComingSoonController()
            centerViewController = UINavigationController(rootViewController: viewController)
        default:
            break
        }
        
        baseSlidingView.centerView.addSubview(centerViewController.view)
        addChild(centerViewController)
        
        baseSlidingView.centerView.bringSubviewToFront(baseSlidingView.darkCoverView)
    }
}
