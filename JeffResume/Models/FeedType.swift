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

enum ItuneURLAudiobooksFeedType: String, CaseIterable, ItuneURLFeedType {
    case topAudiobooks = "top-audiobooks"
    static let allValues = [topAudiobooks]
}

enum ItuneURLMoviesFeedType: String, CaseIterable , ItuneURLFeedType{
    case topMovies = "top-movies"
    static let allValues = [topMovies]
}

enum ItuneURLPodcastsFeedType: String, CaseIterable , ItuneURLFeedType{
    case topPodcasts = "top-podcasts"
    static let allValues = [topPodcasts]
}
