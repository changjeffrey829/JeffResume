//
//  ItuneURLCountry.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/27/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import Foundation

enum ItuneURLCountry: String, CaseIterable {
    case japan = "jp"
    case unitedKingdom = "gb"
    case unitedStates = "us"
    
    static let allValues = [japan, unitedKingdom, unitedStates]
}
