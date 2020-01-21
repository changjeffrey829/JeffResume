//
//  MenuViewModel.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/14/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

class MenuViewModel: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    //MARK:- PROPERTIES
    private let menuCellID = "menuCellID"
    private let headerHeight: CGFloat = 200
    private let menuItems = [
        "Why you should hire me",
        "Nested Controller",
        "Login",
        "Third Party Framework"
    ]
    
    //MARK:- TABLEVIEW DELEGATE AND DATASOURCE
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let customHeaderView = CustomMenuHeaderView()
        return customHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MenuItemCell(style: .default, reuseIdentifier: menuCellID)
        let menuItem = menuItems[indexPath.row]
        cell.titleLabel.attributedText = AStringCreator.HelveticaAString(style: .HelveticaNeue, text: menuItem, size: 16, foregroundColor: .white, backgroundColor: .clear)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 16 {return}
        let slidingController = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController as? BaseSlidingVC
        slidingController?.didSelectMenuItem(index: indexPath.row)
    }
}
