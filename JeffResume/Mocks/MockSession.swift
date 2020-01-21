//
//  Mock.swift
//  IOSGeniusPlaza
//
//  Created by Jeffrey Chang on 5/10/19.
//  Copyright © 2019 Jeffrey Chang. All rights reserved.
//

import Foundation


enum MockURLString: String {
    case mockMovie = "https://rss.itunes.apple.com/api/v1/us/movies/top-movies/all/10/explicit.json"
    case mockPodcast = "https://rss.itunes.apple.com/api/v1/us/podcasts/top-podcasts/all/10/explicit.json"
    case mockAudiobook = "https://rss.itunes.apple.com/api/v1/us/audiobooks/top-audiobooks/all/10/explicit.json"
}

class MockSession: DataSessionProtocol {
    var data: Data?
    var response: URLResponse?
    var error: Error?
    func loadData(from url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        guard let path = getMockObjectPath(url: url) else {
            error = MediaLoadingError.NoMockObject
            completionHandler(data, response, error)
            return
        }
        let url = URL(fileURLWithPath: path)
        do {
            data = try Data(contentsOf: url)
        } catch let err {
            error = err
        }
        completionHandler(data, response, error)
    }
    
    private func getMockObjectPath(url: URL) -> String? {
        switch url.absoluteString {
        case "https://rss.itunes.apple.com/api/v1/us/movies/top-movies/all/10/explicit.json":
            return Bundle.main.path(forResource: "MockMoviesJSON", ofType: "txt")
        case "https://rss.itunes.apple.com/api/v1/us/podcasts/top-podcasts/all/10/explicit.json":
            return Bundle.main.path(forResource: "MockPodcastsJSON", ofType: "txt")
        case "https://rss.itunes.apple.com/api/v1/us/audiobooks/top-audiobooks/all/10/explicit.json":
            return Bundle.main.path(forResource: "MockAudiobooksJSON", ofType: "txt")
        default:
            return nil
        }
    }
}

class MockErrorSession: DataSessionProtocol {
    var data: Data?
    var response: URLResponse?
    var error: Error?
    func loadData(from url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        error = MediaLoadingError.mediaError
        completionHandler(data, response, error)
    }
}
