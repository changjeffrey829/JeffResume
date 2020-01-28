//
//  ItuneURLMovieComponent.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/27/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import Foundation

struct ItuneURLMovieComponent: ItuneMediaComponent {
    var mediaType = MediaType.movies
    var feedTypeURLString: String
    var genreURLString: String
    init(feedTypeOption: ItuneURLMoviesFeedType, genre: ItuneURLMoviesGenre) {
        switch feedTypeOption {
        case .topMovies:
            feedTypeURLString = "top-movies"
        }
        switch genre {
        case .all:
            genreURLString = "all"
        case .actionAndAdventure:
            genreURLString = "action-and-adventure"
        case .documentary:
            genreURLString = "documentary"
        }
    }
}

struct ItuneURLPodcastComponent: ItuneMediaComponent {
    var mediaType = MediaType.podcasts
    var feedTypeURLString: String
    var genreURLString: String
    init(feedTypeOption: ItuneURLPodcastsFeedType, genre: ItuneURLPodcastsGenre) {
        switch feedTypeOption {
        case .topPodcasts:
            feedTypeURLString = "top-podcasts"
        }
        switch genre {
        case .all:
            genreURLString = "all"
        }
    }
}

struct ItuneURLAudiobookComponent: ItuneMediaComponent {
    var mediaType = MediaType.audiobooks
    var feedTypeURLString: String
    var genreURLString: String
    init(feedTypeOption: ItuneURLAudiobooksFeedType, genre: ItuneURLAudiobooksGenre) {
        switch feedTypeOption {
        case .topAudiobooks:
            feedTypeURLString = "top-audiobooks"
        }
        switch genre {
        case .all:
            genreURLString = "all"
        }
    }
}
