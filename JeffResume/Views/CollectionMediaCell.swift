//
//  CollectionMediaCell.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/14/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

class CollectionMediaCell: UICollectionViewCell {
    
    // MARK: - PROPERTIES
    let nameHeight = CollectionMediaCellViewModel.nameHeight
    let padding = CollectionMediaCellViewModel.padding
    var viewModel: CollectionMediaCellViewModel? {
        didSet {
            nameLabel.attributedText = viewModel?.getMediaName()
            viewModel?.bindableImage.bind(observer: { (image) in
                DispatchQueue.main.async {
                    self.mediaImageView.image = image
                }
            })
        }
    }
    
    // MARK: - LIFE CYCLE
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(nameLabel)
        nameLabel.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, paddingTop: 0, paddingLeft: padding, paddingBottom: 0, paddingRight: padding, width: 0, height: nameHeight)
        addSubview(mediaImageView)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let height = frame.height - (nameHeight + padding * 2)
        mediaImageView.anchor(top: nameLabel.bottomAnchor, leading: nil, bottom: nil, trailing: nil, paddingTop: padding, paddingLeft: 0, paddingBottom: padding, paddingRight: 0, width: height, height: height)
        mediaImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI ELEMENTS
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    var mediaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.image = #imageLiteral(resourceName: "FuzzyProfileImage")
        imageView.clipsToBounds = true
        return imageView
    }()
}
