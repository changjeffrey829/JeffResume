//
//  Genre.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/16/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import Foundation

protocol ItuneURLGenre {
    
}

enum ItuneURLMoviesGenre: String, CaseIterable, ItuneURLGenre {
    case all
    case documentary
    case actionAndAdventure = "action-and-adventure"
    static let allValues = [all, documentary, actionAndAdventure]
}

enum ItuneURLPodcastsGenre: String, CaseIterable, ItuneURLGenre {
    case all
    static let allValues = [all]
}

enum ItuneURLAudiobooksGenre: String, CaseIterable, ItuneURLGenre {
    case all
    static let allValues = [all]
}
