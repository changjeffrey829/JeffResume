//
//  SelfBioCellViewModel.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 2/5/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

struct SelfBioCellViewModel {
    private (set) var job: Job
    init(job: Job) {
        self.job = job
    }
    
    func companyNameAString() -> NSAttributedString {
        return AStringCreator.helveticaAString(style: .helveticaNeueBold, text: job.companyName, size: 20, foregroundColor: .white, backgroundColor: .clear)
    }
    
    func jobTitleAString() -> NSAttributedString {
        let titleLabelAString = AStringCreator.helveticaAString(style: .helveticaNeueItalic, text: "Title: ", size: 16, foregroundColor: .orange, backgroundColor: .clear)
        let titleAString = AStringCreator.helveticaAString(style: .helveticaNeueItalic, text: job.jobTitle, size: 16, foregroundColor: .white, backgroundColor: .clear)
        titleLabelAString.append(titleAString)
        return titleLabelAString
    }
    
    func employmentPeriodAString() -> NSAttributedString {
        let employmentPeriodLabelAString = AStringCreator.helveticaAString(style: .helveticaNeueItalic, text: "Employment Period: ", size: 16, foregroundColor: .orange, backgroundColor: .clear)
        let employmentPeriodAString = AStringCreator.helveticaAString(style: .helveticaNeue, text: "\(job.startDate) to \(job.endDate)", size: 16, foregroundColor: .white, backgroundColor: .clear)
        employmentPeriodLabelAString.append(employmentPeriodAString)
        return employmentPeriodLabelAString
    }
    
    func descriptionAString() -> NSAttributedString {
        let descriptLabelAString = AStringCreator.helveticaAString(style: .helveticaNeueItalic, text: "Description: \n", size: 16, foregroundColor: .orange, backgroundColor: .clear)
        let descriptAString = AStringCreator.helveticaAString(style: .helveticaNeue, text: job.description, size: 16, foregroundColor: .white, backgroundColor: .clear)
        descriptLabelAString.append(descriptAString)
        return descriptLabelAString
    }
    
    func technologyAString() -> NSAttributedString? {
        guard let techString = job.technology else {return nil}
        let techLabelAString = AStringCreator.helveticaAString(style: .helveticaNeueItalic, text: "Technology: ", size: 16, foregroundColor: .orange, backgroundColor: .clear)
        let techAString = AStringCreator.helveticaAString(style: .helveticaNeue, text: techString, size: 16, foregroundColor: .white, backgroundColor: .clear)
        techLabelAString.append(techAString)
        return techLabelAString
    }
    
    func appStoreLinkAString() -> NSAttributedString? {
        guard let urlString = job.appStoreLink else {return nil}
        let tosAString = NSMutableAttributedString()
        let aString1 = AStringCreator.helveticaAString(style: .helveticaNeue, text: "App Store:", size: 16, foregroundColor: .orange, backgroundColor: .clear)
        tosAString.append(aString1)
        let linkText = urlString
        if let url = URL(string: linkText) {
            let attributes: [NSAttributedString.Key : Any] = [ NSAttributedString.Key.foregroundColor: UIColor.blue, NSAttributedString.Key.link: url]
            let linkString = NSAttributedString(string: " \(linkText)", attributes: attributes)
            tosAString.append(linkString)
        }
        return tosAString
    }
}
