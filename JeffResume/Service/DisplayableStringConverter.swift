//
//  DisplayableStringConverter.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/27/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import Foundation

struct ItuneDisplayableStringConverter {
    private init() {}
    
    static func getCountryString(country: ItuneURLCountry) -> String {
        switch country {
        case .japan:
            return DisplayableCountryString.japan.rawValue
        case .unitedKingdom:
            return DisplayableCountryString.unitedKingdom.rawValue
        case .unitedStates:
            return DisplayableCountryString.unitedStates.rawValue
        }
    }
    
    static func getFeedTypeStrings(mediaType: MediaType) -> [String] {
        var result = [String]()
        switch mediaType {
        case .movies:
            for feedType in DisplayableMovieFeedTypeString.allValues {
                result.append(feedType.rawValue)
            }
        case .podcasts:
            for feedType in DisplayablePodcastFeedTypeString.allValues {
                result.append(feedType.rawValue)
            }
        case .audiobooks:
            for feedType in DisplayableAudiobookFeedTypeString.allValues {
                result.append(feedType.rawValue)
            }
        }
        return result
    }
    
    static func getGenreString(mediaType: MediaType) -> [String] {
        var result = [String]()
        switch mediaType {
        case .movies:
            for genre in DisplayableMovieGenreString.allValues {
                result.append(genre.rawValue)
            }
        case .podcasts:
            for genre in DisplayablePodcastGenreString.allValues {
                result.append(genre.rawValue)
            }
        case .audiobooks:
            for genre in DisplayableAudiobookGenreString.allValues {
                result.append(genre.rawValue)
            }
        }
        return result
    }
}
