//
//  NestedTableViewCell.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/14/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

class NestedTableViewCell: UITableViewCell {
    
    // MARK: - PROPERTIES
    var viewModel: NestedTableCellViewModel? {
        didSet {
            viewModel?.bindableMediaObjects.bind(observer: { (titleString) in
                DispatchQueue.main.async {
                    self.titleLabel.text = titleString
                    self.detailCollectionView.reloadData()
                }
            })
            detailCollectionView.delegate = viewModel
            detailCollectionView.dataSource = viewModel
            detailCollectionView.reloadData()
        }
    }
    
    // MARK: - LIFE CYCLE
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        detailCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: NestedTableCellViewModel.cellID)
        addSubview(titleLabel)
        titleLabel.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        addSubview(filterButton)
        filterButton.anchor(top: safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 4, width: 30, height: 30)
        detailCollectionView.register(CollectionMediaCell.self, forCellWithReuseIdentifier: NestedTableCellViewModel.cellID)
        addSubview(detailCollectionView)
        detailCollectionView.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: trailingAnchor, paddingTop: 4, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - OBJC PRIVATE METHOD
    @objc private func filterButtonTapped() {
        let filterButtonName = NotificationUserInfoType.filterButton.rawValue
        let mediaType = viewModel?.mediaType ?? MediaType.movies
        let userInfo = [filterButtonName: mediaType] as [String : Any]
        NotificationCenter.default.post(name: .filterButtonTapped, object: nil, userInfo: userInfo)
    }
    
    // MARK: - UI ELEMENTS
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var filterButton: UIButton = {
        let button = UIButton(frame: .zero)
        let image = UIImage(systemName: "slider.horizontal.3")
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var detailCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        return collectionView
    }()
}
