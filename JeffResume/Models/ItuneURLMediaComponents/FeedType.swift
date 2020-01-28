//
//  FeedType.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/16/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import Foundation

protocol ItuneURLFeedType {
    
}

enum ItuneURLAudiobooksFeedType: CaseIterable, ItuneURLFeedType {
    case topAudiobooks
    static let allValues = [topAudiobooks]
}

enum ItuneURLMoviesFeedType: CaseIterable , ItuneURLFeedType {
    case topMovies
    static let allValues = [topMovies]
}

enum ItuneURLPodcastsFeedType: CaseIterable , ItuneURLFeedType {
    case topPodcasts
    static let allValues = [topPodcasts]
}

protocol ItuneMediaComponent {
    var feedTypeURLString: String {get}
    var genreURLString: String {get}
    var mediaType: MediaType {get}
}
