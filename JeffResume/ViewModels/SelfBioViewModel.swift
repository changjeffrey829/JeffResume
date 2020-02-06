//
//  SelfBioViewModel.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 2/5/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

class SelfBioViewModel: NSObject, UITableViewDelegate, UITableViewDataSource {
    // MARK: - PROPERTIES
    static let resumeCellID = "selfBioResumeCellID"
    static let eduCellID = "selfBioEduCellID"
    private let jobs: [Job]
    private let educations: [Education]
    private let headerHeight: CGFloat = 50
    
    // MARK: - LIFE CYCLE
    override init() {
        jobs = ResumeCreator.jobHistory()
        educations = ResumeCreator.education()
        super.init()
    }
    
    // MARK: - PUBLIC METHOD
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return jobs.count
        } else {
            return educations.count
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = SelfBioHeaderView()
        let category = section == 0 ? "Experience" : "Education"
        view.categoryLabel.attributedText = AStringCreator.helveticaAString(style: .helveticaNeueBold, text: category, size: 20, foregroundColor: .orange, backgroundColor: .clear)
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: SelfBioViewModel.resumeCellID, for: indexPath) as? SelfBioResumeCell
            let job = jobs[indexPath.row]
            let cellViewModel = SelfBioCellViewModel(job: job)
            cell?.viewModel = cellViewModel
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: SelfBioViewModel.eduCellID, for: indexPath) as? SelfBioEduCell
            let education = educations[indexPath.item]
            let cellViewModel = SelfBioEduCellViewModel(education: education)
            cell?.viewModel = cellViewModel
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight
    }
    
    func selfBioAString() -> NSAttributedString {
        let attributedString = AStringCreator.helveticaAString(style: .helveticaNeue, text: ResumeCreator.bio(), size: 16, foregroundColor: .white, backgroundColor: .clear)
        attributedString.addAttribute(.link, value: "https://www.linkedin.com/in/jeffrey-chang-9a7abb20/", range: NSRange(location: 40, length: 9))
        attributedString.addAttribute(.link, value: "https://github.com/changjeffrey829/JeffResume", range: NSRange(location: 201, length: 12))
        return attributedString
    }
}
