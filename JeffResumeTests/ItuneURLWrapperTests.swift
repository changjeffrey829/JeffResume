//
//  ItuneURLWrapperTests.swift
//  JeffResumeTests
//
//  Created by Jeffrey Chang on 1/27/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import XCTest
@testable import JeffResume

class ItuneURLWrapperTests: XCTestCase {
    func testConsructItuneMovieURLString() {
        let mockMovieAPIString = "https://rss.itunes.apple.com/api/v1/jp/movies/top-movies/all/10/explicit.json"
        let feedType = ItuneURLMoviesFeedType.topMovies as ItuneURLFeedType
        let genre = ItuneURLMoviesGenre.all as ItuneURLGenre
        let urlString = URLStringCreator.createItuneURLString(mediaType: .movies, country: .japan, feedType: feedType, genre: genre, resultLimit: 10, allowExplicit: true)
        XCTAssertEqual(mockMovieAPIString, urlString, "urlString needs to match mockString")
    }
    
    func testConsructItunePodcastURLString() {
        let mockPodcastsAPIString = "https://rss.itunes.apple.com/api/v1/gb/podcasts/top-podcasts/all/10/explicit.json"
        let feedType = ItuneURLPodcastsFeedType.topPodcasts as ItuneURLFeedType
        let genre = ItuneURLPodcastsGenre.all as ItuneURLGenre
        let urlString = URLStringCreator.createItuneURLString(mediaType: .podcasts, country: .unitedKingdom, feedType: feedType, genre: genre, resultLimit: 10, allowExplicit: true)
        XCTAssertEqual(mockPodcastsAPIString, urlString, "urlString needs to match mockString")
    }
    
    func testConsructItuneAudiobookURLString() {
        let mockPodcastsAPIString = "https://rss.itunes.apple.com/api/v1/us/audiobooks/top-audiobooks/all/10/explicit.json"
        let feedType = ItuneURLAudiobooksFeedType.topAudiobooks as ItuneURLFeedType
        let genre = ItuneURLAudiobooksGenre.all as ItuneURLGenre
        let urlString = URLStringCreator.createItuneURLString(mediaType: .audiobooks, country: .unitedStates, feedType: feedType, genre: genre, resultLimit: 10, allowExplicit: true)
        XCTAssertEqual(mockPodcastsAPIString, urlString, "urlString needs to match mockString")
    }
    
    func testURLStringResultLimitNoMoreThan100() {
        let mockMovieAPIString = "https://rss.itunes.apple.com/api/v1/us/movies/top-movies/all/100/explicit.json"
        let feedType = ItuneURLMoviesFeedType.topMovies as ItuneURLFeedType
        let genre = ItuneURLMoviesGenre.all as ItuneURLGenre
        let urlString = URLStringCreator.createItuneURLString(mediaType: .movies, country: .unitedStates, feedType: feedType, genre: genre, resultLimit: 200, allowExplicit: true)
        XCTAssertEqual(mockMovieAPIString, urlString, "urlString needs to match mockString")
    }
    
    
}
