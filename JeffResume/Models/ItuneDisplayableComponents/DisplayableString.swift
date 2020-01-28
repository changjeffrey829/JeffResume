//
//  DisplayableString.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/27/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import Foundation

enum DisplayableCountryString: String, CaseIterable {
    case unitedStates = "United States"
    case unitedKingdom = "United Kingdom"
    case japan = "Japan"
    
    static let allValues = [japan, unitedKingdom, unitedStates]
}

enum DisplayableMovieFeedTypeString: String, CaseIterable {
    case topMovies = "Top Movies"
    
    static let allValues = [topMovies]
}

enum DisplayablePodcastFeedTypeString: String, CaseIterable {
    case topPodcasts = "Top Podcasts"
    static let allValues = [topPodcasts]
}

enum DisplayableAudiobookFeedTypeString: String, CaseIterable {
    case topAudiobooks = "Top Audiobooks"
    static let allValues = [topAudiobooks]
}

enum DisplayableMovieGenreString: String, CaseIterable {
    case all = "All"
    case actionAndAdventure = "Action and Adventure"
    case documentary = "Documentary"
    static let allValues = [all, documentary, actionAndAdventure]
}

enum DisplayablePodcastGenreString: String, CaseIterable {
    case all = "All"
    static let allValues = [all]
}

enum DisplayableAudiobookGenreString: String, CaseIterable {
    case all = "All"
    static let allValues = [all]
}
