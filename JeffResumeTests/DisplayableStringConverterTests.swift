//
//  DisplayableStringConverterTests.swift
//  JeffResumeTests
//
//  Created by Jeffrey Chang on 1/27/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import XCTest
@testable import JeffResume

class DisplayableStringConverterTests: XCTestCase {
    func testGetCountryString() {
        let japanDisplayableString = ItuneDisplayableStringConverter.getCountryString(country: .japan)
        let unitedKingdomDisplayableString = ItuneDisplayableStringConverter.getCountryString(country: .unitedKingdom)
        let unitedStatesDisplayableString = ItuneDisplayableStringConverter.getCountryString(country: .unitedStates)
        XCTAssertEqual(japanDisplayableString, "Japan", "displayableString does not match")
        XCTAssertEqual(unitedKingdomDisplayableString, "United Kingdom", "displayableString does not match")
        XCTAssertEqual(unitedStatesDisplayableString, "United States", "displayableString does not match")
    }
    
    func testDisplayableFeedTypeCountMatchURLFeedTypeCount() {
        let movieFeedTypes = ItuneDisplayableStringConverter.getFeedTypeStrings(mediaType: .movies)
        let podcastFeedTypes = ItuneDisplayableStringConverter.getFeedTypeStrings(mediaType: .podcasts)
        let audiobookFeedTypes = ItuneDisplayableStringConverter.getFeedTypeStrings(mediaType: .audiobooks)
        XCTAssertEqual(movieFeedTypes.count, ItuneURLMoviesFeedType.allValues.count, "movie feedType count does not match")
        XCTAssertEqual(podcastFeedTypes.count, ItuneURLPodcastsFeedType.allValues.count, "podcast feedType count does not match")
        XCTAssertEqual(audiobookFeedTypes.count, ItuneURLAudiobooksFeedType.allValues.count, "audiobook feedType count does not match")
    }
    
    func testDisplayableGenreCountMatchURLGenreCount() {
        let movieGenres = ItuneDisplayableStringConverter.getGenreString(mediaType: .movies)
        let podcastGenres = ItuneDisplayableStringConverter.getGenreString(mediaType: .podcasts)
        let audiobookGenres = ItuneDisplayableStringConverter.getGenreString(mediaType: .audiobooks)
        XCTAssertEqual(movieGenres.count, ItuneURLMoviesGenre.allValues.count, "movie genre count does not match")
        XCTAssertEqual(podcastGenres.count, ItuneURLPodcastsGenre.allValues.count, "podcast genre count does not match")
        XCTAssertEqual(audiobookGenres.count, ItuneURLAudiobooksGenre.allValues.count, "podcast genre count does not match")
    }
}
