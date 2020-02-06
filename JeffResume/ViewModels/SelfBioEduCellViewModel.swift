//
//  SelfBioEduCellViewModel.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 2/5/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import Foundation

struct SelfBioEduCellViewModel {
    // MARK: - PROPERTY
    private let education: Education
    
    init(education: Education) {
        self.education = education
    }
    
    // MARK: - PUBLIC METHOD
    func schoolNameAString() -> NSAttributedString {
        return AStringCreator.helveticaAString(style: .helveticaNeueBold, text: education.schoolName, size: 16, foregroundColor: .white, backgroundColor: .clear)
    }
    
    func dateAString() -> NSAttributedString {
        let resultAString = AStringCreator.helveticaAString(style: .helveticaNeueItalic, text: "Date: ", size: 16, foregroundColor: .orange, backgroundColor: .clear)
        let dateAString = AStringCreator.helveticaAString(style: .helveticaNeue, text: "\(education.startYear) - \(education.endYear)", size: 16, foregroundColor: .white, backgroundColor: .clear)
        resultAString.append(dateAString)
        return resultAString
    }
    
    func majorAString() -> NSAttributedString {
        let resultAString = AStringCreator.helveticaAString(style: .helveticaNeueItalic, text: "Major: ", size: 16, foregroundColor: .orange, backgroundColor: .clear)
        let majorAString = AStringCreator.helveticaAString(style: .helveticaNeue, text: education.major, size: 16, foregroundColor: .white, backgroundColor: .clear)
        resultAString.append(majorAString)
        return resultAString
    }
}
