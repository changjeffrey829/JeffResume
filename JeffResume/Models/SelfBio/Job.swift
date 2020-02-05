//
//  Employment.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 2/3/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import Foundation

struct Job {
    let companyName: String
    let jobTitle: String
    let startDate: Date
    let endDate: Date?
    let description: String
    let technology: String
    let appStoreLink: String?
}

struct Education {
    let schoolName: String
    let startYear: String
    let endYear: String
    let major: String
}
