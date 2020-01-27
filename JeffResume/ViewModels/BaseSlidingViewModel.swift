//
//  BaseSlidingViewModel.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/24/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

struct BaseSlidingViewModel {
    let menuWidth: CGFloat
    let velocityThreshold: CGFloat
    var isMenuOpened = false
    init(menuWidth: CGFloat, velocityThreshold: CGFloat) {
        self.menuWidth = menuWidth
        self.velocityThreshold = velocityThreshold
    }
    
    func panGestureXCalculation(gestureTranslationX: CGFloat) -> CGFloat {
        var transX = gestureTranslationX
        transX = isMenuOpened ? transX + menuWidth : transX
        transX = min(menuWidth, transX)
        return max(0, transX)
    }
    
    func shouldOpenMenu(translation: CGPoint, velocity: CGPoint) -> Bool {
        if isMenuOpened {
            if velocity.x < -velocityThreshold {
                return false
            }
            if abs(translation.x) < menuWidth / 2 {
                return true
            } else {
                return false
            }
        } else {
            if velocity.x > velocityThreshold {
                return true
            }
            if translation.x < menuWidth / 2 {
                return false
            } else {
                return true
            }
        }
    }
}
