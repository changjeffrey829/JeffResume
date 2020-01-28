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
    
    func createItuneURLString() -> String? {
        let mediaComponent: ItuneMediaComponent
        switch mediaType {
        case .movies:
            mediaComponent = ItuneURLMediaComponent(movieFeedTypeOption: .topMovies, movieGenre: .all)
        case .podcasts:
            mediaComponent = ItuneURLMediaComponent(podcastFeedTypeOption: .topPodcasts, podcastGenre: .all)
        case .audiobooks:
            mediaComponent = ItuneURLMediaComponent(audiobookFeedTypeOption: .topAudiobooks, audiobookGenre: .all)
        }
        return URLStringCreator.createItuneURLString(ituneMediaComponent: mediaComponent, country: country, resultLimit: resultLimit, allowExplicit: allowExplicit)
    }
}
