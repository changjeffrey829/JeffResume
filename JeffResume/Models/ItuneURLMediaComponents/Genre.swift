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

enum ItuneURLMoviesGenre: CaseIterable, ItuneURLGenre {
    case all
    case documentary
    case actionAndAdventure
    static let allValues = [all, documentary, actionAndAdventure]
}

enum ItuneURLPodcastsGenre: CaseIterable, ItuneURLGenre {
    case all
    static let allValues = [all]
}

enum ItuneURLAudiobooksGenre: CaseIterable, ItuneURLGenre {
    case all
    static let allValues = [all]
}
