//
//  NestedCollectionDetailViewModel.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/14/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

class NestedTableCellViewModel: NSObject {
    let mediaType: MediaType
    private let networkService: MediaProtocol
    private var cellHeight: CGFloat = 100
    private var mediaObjects = [MediaObject]() {
        didSet {
            bindableMediaObjects.value = titleText()
        }
    }
    static let cellID = "collectionCellID"
    var bindableMediaObjects = Bindable<String>()
    
    init(mediaType: MediaType, urlString: String, networkService: MediaProtocol = NetworkService()) {
        self.networkService = networkService
        self.mediaType = mediaType
        super.init()
        loadMedia(urlString: urlString) { (result) in
            switch result {
            case .failure(_):
                self.mediaObjects = []
            case .success(let jsonObjects):
                self.mediaObjects = jsonObjects
            }
        }
    }
    
    func loadMedia(urlString: String, completion: @escaping (Result<[MediaObject], MediaLoadingError>) -> ()) {
        networkService.loadMedia(urlString: urlString) { (result) in
            completion(result)
        }
    }
    
    private func createCollectionMediaViewModel(index: Int) -> CollectionMediaCellViewModel {
        let mediaObject = mediaObjects[index]
        return CollectionMediaCellViewModel(mediaObject: mediaObject)
    }
    
    private func titleText() -> String {
        return mediaType.rawValue
    }
}

extension NestedTableCellViewModel: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mediaObjects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NestedTableCellViewModel.cellID, for: indexPath) as? CollectionMediaCell
        cell?.viewModel = createCollectionMediaViewModel(index: indexPath.row)
        cell?.layer.borderWidth = 1
        cell?.layer.borderColor = UIColor.white.cgColor
        cell?.layer.cornerRadius = 10
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellHeight, height: cellHeight)
    }
}

