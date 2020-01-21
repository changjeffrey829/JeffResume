//
//  NetworkService.swift
//  IOSGeniusPlaza
//
//  Created by Jeffrey Chang on 5/9/19.
//  Copyright © 2019 Jeffrey Chang. All rights reserved.
//

import UIKit

enum MediaLoadingError: Error {
    case imageError
    case mediaError
    case NoMockObject
}

protocol MediaProtocol {
    func loadMedia(urlString: String, completion: @escaping (Result<[MediaObject], MediaLoadingError>) ->())
    func loadImage(urlString: String, completion: @escaping (Result<UIImage, MediaLoadingError>) -> ())
}

struct NetworkService: MediaProtocol {
    private let session: DataSessionProtocol
    init(session: DataSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func loadImage(urlString: String, completion: @escaping (Result<UIImage, MediaLoadingError>) -> ()) {
        guard let url = URL(string: urlString) else {
            completion(.failure(MediaLoadingError.imageError))
            return}
        
        session.loadData(from: url) { (data, response, err) in
            if err != nil {
                completion(.failure(MediaLoadingError.imageError))
                return
            }
            
            guard
                let imageData = data,
                let photoImage = UIImage(data: imageData)
                else {
                    completion(.failure(MediaLoadingError.imageError))
                    return }
            completion(.success(photoImage))
        }
    }
    
    func loadMedia(urlString: String, completion: @escaping (Result<[MediaObject], MediaLoadingError>) -> ()) {
        guard let url = URL(string: urlString) else {
            completion(.failure(MediaLoadingError.mediaError))
            return
        }
        
        session.loadData(from: url) { (data, response, err) in
            if err != nil {
                completion(.failure(MediaLoadingError.mediaError))
                return
            }
            do {
                let decoder = JSONDecoder()
                guard let data = data else {return}
                let rawNetworkResponse = try decoder.decode(RawNetworkResponse.self, from: data)
                completion(.success(rawNetworkResponse.feed.results))
            } catch {
                completion(.failure(MediaLoadingError.mediaError))
            }
        }
    }
}
