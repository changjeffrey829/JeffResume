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
        let mediaComponent = ItuneURLMovieComponent(feedTypeOption: .topMovies, genre: .all)
        let urlString = URLStringCreator.createItuneURLString(ituneMediaComponent: mediaComponent, country: .japan, resultLimit: 10, allowExplicit: true)
        XCTAssertEqual(mockMovieAPIString, urlString, "urlString needs to match mockString")
    }
    
    func testConsructItunePodcastURLString() {
        let mockPodcastsAPIString = "https://rss.itunes.apple.com/api/v1/gb/podcasts/top-podcasts/all/10/explicit.json"
        let mediaComponent = ItuneURLPodcastComponent(feedTypeOption: .topPodcasts, genre: .all)
        let urlString = URLStringCreator.createItuneURLString(ituneMediaComponent: mediaComponent, country: .unitedKingdom, resultLimit: 10, allowExplicit: true)
        XCTAssertEqual(mockPodcastsAPIString, urlString, "urlString needs to match mockString")
    }
    
    func testConsructItuneAudiobookURLString() {
        let mockPodcastsAPIString = "https://rss.itunes.apple.com/api/v1/us/audiobooks/top-audiobooks/all/10/explicit.json"
        let mediaComponent = ItuneURLAudiobookComponent(feedTypeOption: .topAudiobooks, genre: .all)
        let urlString = URLStringCreator.createItuneURLString(ituneMediaComponent: mediaComponent, country: .unitedStates, resultLimit: 10, allowExplicit: true)
        XCTAssertEqual(mockPodcastsAPIString, urlString, "urlString needs to match mockString")
    }
    
    func testURLStringResultLimitNoMoreThan100() {
        let mockMovieAPIString = "https://rss.itunes.apple.com/api/v1/us/movies/top-movies/all/100/explicit.json"
        let mediaComponent = ItuneURLMovieComponent(feedTypeOption: .topMovies, genre: .all)
        let urlString = URLStringCreator.createItuneURLString(ituneMediaComponent: mediaComponent, country: .unitedStates, resultLimit: 200, allowExplicit: true)
        XCTAssertEqual(mockMovieAPIString, urlString, "urlString needs to match mockString")
    }
    
    
}
