//
//  BaseSlidingView.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/24/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

class CenterContainerView: UIView {}
class MenuContainerView: UIView {}
class DarkCoverView: UIView {}

class BaseSlidingView: UIView {
    var centerViewLeadingConstraint: NSLayoutConstraint!
    var centerViewTrailingConstraint: NSLayoutConstraint!
    
    init(frame: CGRect, menuWidth: CGFloat, centerCoverView: UIView, sideCoverView: UIView) {
        self.centerCoverView = centerCoverView
        self.sideCoverView = sideCoverView
        super.init(frame: frame)
        addSubview(centerView)
        addSubview(sideView)
        
        NSLayoutConstraint.activate([
            centerView.topAnchor.constraint(equalTo: topAnchor),
            centerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            sideView.topAnchor.constraint(equalTo: topAnchor),
            sideView.trailingAnchor.constraint(equalTo: centerView.leadingAnchor),
            sideView.widthAnchor.constraint(equalToConstant: menuWidth),
            sideView.bottomAnchor.constraint(equalTo: centerView.bottomAnchor)
            ])
        
        centerViewLeadingConstraint = centerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0)
        centerViewLeadingConstraint.isActive = true
        centerViewTrailingConstraint = centerView.trailingAnchor.constraint(equalTo: trailingAnchor)
        centerViewTrailingConstraint.isActive = true
        
        centerCoverView.translatesAutoresizingMaskIntoConstraints = false
        sideCoverView.translatesAutoresizingMaskIntoConstraints = false
        
        centerView.addSubview(centerCoverView)
        centerView.addSubview(darkCoverView)
        sideView.addSubview(sideCoverView)
        
        NSLayoutConstraint.activate([
            // top, leading, bottom, trailing anchors
            centerCoverView.topAnchor.constraint(equalTo: centerView.topAnchor),
            centerCoverView.leadingAnchor.constraint(equalTo: centerView.leadingAnchor),
            centerCoverView.bottomAnchor.constraint(equalTo: centerView.bottomAnchor),
            centerCoverView.trailingAnchor.constraint(equalTo: centerView.trailingAnchor),
            
            sideCoverView.topAnchor.constraint(equalTo: sideView.topAnchor),
            sideCoverView.leadingAnchor.constraint(equalTo: sideView.leadingAnchor),
            sideCoverView.bottomAnchor.constraint(equalTo: sideView.bottomAnchor),
            sideCoverView.trailingAnchor.constraint(equalTo: sideView.trailingAnchor),
            
            darkCoverView.topAnchor.constraint(equalTo: centerView.topAnchor),
            darkCoverView.leadingAnchor.constraint(equalTo: centerView.leadingAnchor),
            darkCoverView.bottomAnchor.constraint(equalTo: centerView.bottomAnchor),
            darkCoverView.trailingAnchor.constraint(equalTo: centerView.trailingAnchor)
            ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let centerCoverView: UIView
    
    let sideCoverView: UIView
    
    let centerView: CenterContainerView = {
        let view = CenterContainerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let sideView: MenuContainerView = {
        let view = MenuContainerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let darkCoverView: DarkCoverView = {
        let view = DarkCoverView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}
