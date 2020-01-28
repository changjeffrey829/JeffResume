//
//  ItuneURLMovieComponent.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/27/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import Foundation

struct ItuneURLMediaComponent: ItuneMediaComponent {
    var mediaType: MediaType
    var feedTypeURLString: String
    var genreURLString: String
    init(movieFeedTypeOption: ItuneURLMoviesFeedType, movieGenre: ItuneURLMoviesGenre) {
        self.mediaType = .movies
        switch movieFeedTypeOption {
        case .topMovies:
            feedTypeURLString = "top-movies"
        }
        switch movieGenre {
        case .all:
            genreURLString = "all"
        case .actionAndAdventure:
            genreURLString = "action-and-adventure"
        case .documentary:
            genreURLString = "documentary"
        }
    }
    
    init(podcastFeedTypeOption: ItuneURLPodcastsFeedType, podcastGenre: ItuneURLPodcastsGenre) {
        self.mediaType = .podcasts
        switch podcastFeedTypeOption {
        case .topPodcasts:
            feedTypeURLString = "top-podcasts"
        }
        switch podcastGenre {
        case .all:
            genreURLString = "all"
        }
    }
    
    init(audiobookFeedTypeOption: ItuneURLAudiobooksFeedType, audiobookGenre: ItuneURLAudiobooksGenre) {
        self.mediaType = .audiobooks
        switch audiobookFeedTypeOption {
        case .topAudiobooks:
            feedTypeURLString = "top-audiobooks"
        }
        switch audiobookGenre {
        case .all:
            genreURLString = "all"
        }
    }
}
