//
//  SelfBioViewModel.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 2/5/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

class SelfBioViewModel: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    static let cellID = "selfBioCellID"
    
    private let jobs: [Job]
    
    override init() {
        jobs = ResumeCreator.jobHistory()
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SelfBioViewModel.cellID, for: indexPath) as? SelfBioResumeCell
        let job = jobs[indexPath.row]
        let cellViewModel = SelfBioCellViewModel(job: job)
        cell?.viewModel = cellViewModel
        return cell ?? UITableViewCell()
    }
    
    func selfBioAString() -> NSAttributedString {
        let attributedString = AStringCreator.helveticaAString(style: .helveticaNeue, text: ResumeCreator.bio(), size: 16, foregroundColor: .white, backgroundColor: .clear)
        attributedString.addAttribute(.link, value: "https://www.linkedin.com/in/jeffrey-chang-9a7abb20/", range: NSRange(location: 40, length: 9))
        attributedString.addAttribute(.link, value: "https://github.com/changjeffrey829/JeffResume", range: NSRange(location: 201, length: 12))
        return attributedString
    }
}
