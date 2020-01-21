//
//  menuController.swift
//  TLCTestPrep
//
//  Created by Jeffrey Chang on 6/6/19.
//  Copyright © 2019 Jeffrey Chang. All rights reserved.
//

import UIKit

class MenuController: UITableViewController {
    
    //MARK:- PROPERTY
    let viewModel: MenuViewModel
    
    //MARK:- LIFE CYCLE
    init(viewModel: MenuViewModel) {
        self.viewModel = viewModel
        super.init(style: .grouped)
        self.tableView.delegate = viewModel
        self.tableView.dataSource = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .black
        tableView.separatorStyle = .none
    }
}
