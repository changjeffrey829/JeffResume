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
    static func createMoviesAPI(country: ItuneURLCountry, feedType: ItuneURLMoviesFeedType, genre: ItuneURLMoviesGenre, resultLimit: Int, allowExplicit: Bool) -> String {
        return constructURLString(mediaType: .movies, country: country.rawValue, feedtype: feedType.rawValue, genre: genre.rawValue, resultLimit: resultLimit, allowExplicit: allowExplicit)
    }
    
    static func createPodcastsAPI(country: ItuneURLCountry, feedType: ItuneURLPodcastsFeedType, genre: ItuneURLPodcastsGenre, resultLimit: Int, allowExplicit: Bool) -> String {
        return constructURLString(mediaType: .podcasts, country: country.rawValue, feedtype: feedType.rawValue, genre: genre.rawValue, resultLimit: resultLimit, allowExplicit: allowExplicit)
    }
    
    static func createAudiobooksAPI(country: ItuneURLCountry, feedType: ItuneURLAudiobooksFeedType, genre: ItuneURLAudiobooksGenre, resultLimit: Int, allowExplicit: Bool) -> String {
        return constructURLString(mediaType: .audiobooks, country: country.rawValue, feedtype: feedType.rawValue, genre: genre.rawValue, resultLimit: resultLimit, allowExplicit: allowExplicit)
    }
    
    static private func constructURLString(mediaType: MediaType, country: String, feedtype: String, genre: String, resultLimit: Int, allowExplicit: Bool) -> String {
        let explicit = allowExplicit ? "explicit" : "non-explicit"
        let checkedResultLimit = resultLimit <= 100 ? resultLimit : 100
        return BaseURL.itunesRSS.rawValue + "\(country)/\(mediaType.rawValue)/\(feedtype)/\(genre)/\(checkedResultLimit)/\(explicit).json"
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
