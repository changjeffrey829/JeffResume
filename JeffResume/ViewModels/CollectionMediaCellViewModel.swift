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
    
    //MARK:- PROPERTIES
    static let nameHeight: CGFloat = 20
    static let padding: CGFloat = 4
    private var lastUrlUsedToLoadImage: String?
    private var networkService: MediaProtocol
    private var mediaObject: MediaObject
    private var mediaImage: UIImage? {
        didSet {
            bindableImage.value = mediaImage
        }
    }
    var bindableImage = Bindable<UIImage>()
    
    //MARK:- LIFE CYCLE
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
    
    //MARK:- METHODS
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
