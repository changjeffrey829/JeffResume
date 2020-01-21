//
//  BaseSlidingVC.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/10/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

class CenterContainerView: UIView {}
class MenuContainerView: UIView {}
class DarkCoverView: UIView {}

class BaseSlidingVC: UIViewController {
    
    let centerView: CenterContainerView = {
        let v = CenterContainerView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let sideView: MenuContainerView = {
        let v = MenuContainerView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let darkCoverView: DarkCoverView = {
        let v = DarkCoverView()
        v.backgroundColor = UIColor(white: 0, alpha: 0.7)
        v.alpha = 0
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapDismiss))
        darkCoverView.addGestureRecognizer(tapGesture)
    }
    
    @objc fileprivate func handleTapDismiss() {
        closeMenu()
    }
    
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        var x = translation.x
        
        x = isMenuOpened ? x + menuWidth : x
        x = min(menuWidth, x)
        x = max(0, x)
        
        centerViewLeadingConstraint.constant = x
        centerViewTrailingConstraint.constant = x
        darkCoverView.alpha = x / menuWidth
        
        if gesture.state == .ended {
            handleEnded(gesture: gesture)
        }
    }
    
    fileprivate func handleEnded(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        let velocity = gesture.velocity(in: view)
        
        if isMenuOpened {
            if velocity.x < -velocityThreshold {
                closeMenu()
                return
            }
            if abs(translation.x) < menuWidth / 2 {
                openMenu()
            } else {
                closeMenu()
            }
        } else {
            if velocity.x > velocityThreshold {
                openMenu()
                return
            }
            
            if translation.x < menuWidth / 2 {
                closeMenu()
            } else {
                openMenu()
            }
        }
    }
    
    func openMenu() {
        isMenuOpened = true
        centerViewLeadingConstraint.constant = menuWidth
        centerViewTrailingConstraint.constant = menuWidth
        performAnimations()
        setNeedsStatusBarAppearanceUpdate()
    }
    
    func closeMenu() {
        centerViewLeadingConstraint.constant = 0
        centerViewTrailingConstraint.constant = 0
        isMenuOpened = false
        performAnimations()
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return isMenuOpened ? .lightContent : .default
    }
    
    func didSelectMenuItem(index: Int) {
        closeMenu()
        
        switch index {
        case 0:
            performRightViewCleanUp()
            let vc = ComingSoonViewController()
            centerViewController = UINavigationController(rootViewController: vc)
        case 1:
            performRightViewCleanUp()
            let vm = NestedViewModel(mediaTypes: [.movies, .podcasts, .audiobooks])
            let homeController = NestedViewController(viewModel: vm)
            centerViewController = UINavigationController(rootViewController: homeController)
        case 2:
            performRightViewCleanUp()
            let vc = ComingSoonViewController()
            centerViewController = UINavigationController(rootViewController: vc)
        case 3:
            performRightViewCleanUp()
            
            let vc = ComingSoonViewController()
            centerViewController = UINavigationController(rootViewController: vc)
        case 4:
            performRightViewCleanUp()
            let vc = ComingSoonViewController()
            centerViewController = UINavigationController(rootViewController: vc)
        default:
            break
        }
        
        centerView.addSubview(centerViewController.view)
        addChild(centerViewController)
        
        centerView.bringSubviewToFront(darkCoverView)
    }
    
    var centerViewController = showDefaultViewController()
    let menuController = MenuController(viewModel: MenuViewModel())
    
    static private func showDefaultViewController() -> UIViewController {
        let vc = ComingSoonViewController()
        return UINavigationController(rootViewController: vc)
    }
    
    private func performRightViewCleanUp() {
        centerViewController.view.removeFromSuperview()
        centerViewController.removeFromParent()
    }
    
    private func performAnimations() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            self.darkCoverView.alpha = self.isMenuOpened ? 1 : 0
        })
    }
    
    var centerViewLeadingConstraint: NSLayoutConstraint!
    var centerViewTrailingConstraint: NSLayoutConstraint!
    fileprivate let menuWidth: CGFloat = 250
    fileprivate let velocityThreshold: CGFloat = 500
    fileprivate var isMenuOpened = false
    
    fileprivate func setupViews() {
        view.addSubview(centerView)
        view.addSubview(sideView)
        
        // let's go ahead and use Auto Layout
        NSLayoutConstraint.activate([
            centerView.topAnchor.constraint(equalTo: view.topAnchor),
            centerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            sideView.topAnchor.constraint(equalTo: view.topAnchor),
            sideView.trailingAnchor.constraint(equalTo: centerView.leadingAnchor),
            sideView.widthAnchor.constraint(equalToConstant: menuWidth),
            sideView.bottomAnchor.constraint(equalTo: centerView.bottomAnchor)
            ])
        
        centerViewLeadingConstraint = centerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        centerViewLeadingConstraint.isActive = true
        centerViewTrailingConstraint = centerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        centerViewTrailingConstraint.isActive = true
        setupViewControllers()
    }
    
    fileprivate func setupViewControllers() {
        
        let homeView = centerViewController.view!
        let menuView = menuController.view!
        
        homeView.translatesAutoresizingMaskIntoConstraints = false
        menuView.translatesAutoresizingMaskIntoConstraints = false
        
        centerView.addSubview(homeView)
        centerView.addSubview(darkCoverView)
        sideView.addSubview(menuView)
        
        NSLayoutConstraint.activate([
            // top, leading, bottom, trailing anchors
            homeView.topAnchor.constraint(equalTo: centerView.topAnchor),
            homeView.leadingAnchor.constraint(equalTo: centerView.leadingAnchor),
            homeView.bottomAnchor.constraint(equalTo: centerView.bottomAnchor),
            homeView.trailingAnchor.constraint(equalTo: centerView.trailingAnchor),
            
            menuView.topAnchor.constraint(equalTo: sideView.topAnchor),
            menuView.leadingAnchor.constraint(equalTo: sideView.leadingAnchor),
            menuView.bottomAnchor.constraint(equalTo: sideView.bottomAnchor),
            menuView.trailingAnchor.constraint(equalTo: sideView.trailingAnchor),
            
            darkCoverView.topAnchor.constraint(equalTo: centerView.topAnchor),
            darkCoverView.leadingAnchor.constraint(equalTo: centerView.leadingAnchor),
            darkCoverView.bottomAnchor.constraint(equalTo: centerView.bottomAnchor),
            darkCoverView.trailingAnchor.constraint(equalTo: centerView.trailingAnchor),
            ])
        
        addChild(centerViewController)
        addChild(menuController)
    }
    
}
