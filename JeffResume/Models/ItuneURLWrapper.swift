//
//  ItuneURLWrapper.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/21/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import Foundation

struct ItuneURLWrapper {
    let mediaType: MediaType
    var country: ItuneURLCountry
    var feedType: ItuneURLFeedType
    var genre: ItuneURLGenre
    var resultLimit: Int
    var allowExplicit: Bool
    
    init(mediaType: MediaType, country: ItuneURLCountry, resultLimit: Int, allowExplicit: Bool, feedType: ItuneURLFeedType, genre: ItuneURLGenre) {
        self.mediaType = mediaType
        self.country = country
        self.resultLimit = resultLimit
        self.allowExplicit = allowExplicit
        self.feedType = feedType
        self.genre = genre
    }
    
    func createItuneURLString() -> String {
        switch mediaType {
        case .movies:
            let feedType = self.feedType as? ItuneURLMoviesFeedType ?? ItuneURLMoviesFeedType.topMovies
            let genre = self.genre as? ItuneURLMoviesGenre ?? ItuneURLMoviesGenre.all
            return URLStringCreator.createMoviesAPI(country: country, feedType: feedType, genre: genre, resultLimit: resultLimit, allowExplicit: allowExplicit)
        case .podcasts:
            let feedType = self.feedType as? ItuneURLPodcastsFeedType ?? ItuneURLPodcastsFeedType.topPodcasts
            let genre = self.genre as? ItuneURLPodcastsGenre ?? ItuneURLPodcastsGenre.all
            return URLStringCreator.createPodcastsAPI(country: country, feedType: feedType, genre: genre, resultLimit: resultLimit, allowExplicit: allowExplicit)
        case .audiobooks:
            let feedType = self.feedType as? ItuneURLAudiobooksFeedType ?? ItuneURLAudiobooksFeedType.topAudiobooks
            let genre = self.genre as? ItuneURLAudiobooksGenre ?? ItuneURLAudiobooksGenre.all
            return URLStringCreator.createAudiobooksAPI(country: country, feedType: feedType, genre: genre, resultLimit: resultLimit, allowExplicit: allowExplicit)
        }
    }
}
