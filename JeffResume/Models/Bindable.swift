//
//  Bindable.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/14/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import Foundation

class Bindable<T> {
    var value: T? {
        didSet {
            observer?(value)
        }
    }
    
    var observer: ((T?)->())?
    
    func bind(observer: @escaping (T?) ->()) {
        self.observer = observer
    }
    
}
