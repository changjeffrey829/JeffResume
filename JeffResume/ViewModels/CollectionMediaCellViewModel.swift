//
//  MovieViewModel.swift
//  IOSGeniusPlaza
//
//  Created by Jeffrey Chang on 5/10/19.
//  Copyright © 2019 Jeffrey Chang. All rights reserved.
//

import UIKit

//MARK:- SIMPLE IMAGE CACHE
var imageCache = [String : UIImage]()

class CollectionMediaCellViewModel {
    
    private var lastUrlUsedToLoadImage: String?
    
    private var networkService: MediaProtocol
    
    private var mediaObject: MediaObject
    
    var bindableImage = Bindable<UIImage>()
    
    private var mediaImage: UIImage? {
        didSet {
            bindableImage.value = mediaImage
        }
    }
    
    init(mediaObject: MediaObject, networkService: MediaProtocol = NetworkService()) {
        self.networkService = networkService
        self.mediaObject = mediaObject
        getImagefromURL { (result) in
            switch result {
            case .failure(_):
                self.mediaImage = nil
            case .success(let image):
                self.mediaImage = image
            }
        }
    }
    
    func getMediaName() -> NSAttributedString {
        return AStringCreator.HelveticaAString(style: .HelveticaNeue, text: mediaObject.name, size: 16, foregroundColor: .black, backgroundColor: .clear)
    }
    
    func getImagefromURL(completion: @escaping (Result<UIImage, MediaLoadingError>) -> ()) {
        let urlString = mediaObject.artworkUrl100
        lastUrlUsedToLoadImage = urlString
        if let cachedimage = imageCache[urlString] {
            completion(.success(cachedimage))
            return
        }
        networkService.loadImage(urlString: urlString) { (result) in
            completion(result)
        }
    }
}
