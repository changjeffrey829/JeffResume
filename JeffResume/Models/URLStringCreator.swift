//
//  APICreator.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/13/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import Foundation

struct URLStringCreator {
    private init() {}
    
    static func createItuneURLString(mediaType: MediaType, country: ItuneURLCountry, feedType: ItuneURLFeedType, genre: ItuneURLGenre, resultLimit: Int, allowExplicit: Bool) -> String? {
        let feedTypeString: String
        let genreString: String
        switch mediaType {
        case .movies:
            guard
                let feedType = feedType as? ItuneURLMoviesFeedType,
                let genre = genre as? ItuneURLMoviesGenre
                else {return nil}
            feedTypeString = feedType.rawValue
            genreString = genre.rawValue
        case .audiobooks:
            guard
                let feedType = feedType as? ItuneURLAudiobooksFeedType,
                let genre = genre as? ItuneURLAudiobooksGenre
                else {return nil}
            feedTypeString = feedType.rawValue
            genreString = genre.rawValue
        case .podcasts:
            guard
                let feedType = feedType as? ItuneURLPodcastsFeedType,
                let genre = genre as? ItuneURLPodcastsGenre
                else {return nil}
            feedTypeString = feedType.rawValue
            genreString = genre.rawValue
        }
        return constructURLString(mediaType: mediaType, country: country, feedtype: feedTypeString, genre: genreString, resultLimit: resultLimit, allowExplicit: allowExplicit)
    }
    
    static private func constructURLString(mediaType: MediaType, country: ItuneURLCountry, feedtype: String, genre: String, resultLimit: Int, allowExplicit: Bool) -> String {
        let explicit = allowExplicit ? "explicit" : "non-explicit"
        let checkedResultLimit = resultLimit <= 100 ? resultLimit : 100
        return BaseURL.itunesRSS.rawValue + "\(country.rawValue)/\(mediaType.rawValue)/\(feedtype)/\(genre)/\(checkedResultLimit)/\(explicit).json"
    }
    
}

enum BaseURL: String {
    case itunesRSS = "https://rss.itunes.apple.com/api/v1/"
}

enum ItuneURLCountry: String, CaseIterable {
    case japan = "jp"
    case unitedKingdom = "gb"
    case unitedStates = "us"
    
    static let allValues = [japan, unitedKingdom, unitedStates]
}
