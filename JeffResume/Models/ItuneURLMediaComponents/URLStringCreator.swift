//
//  APICreator.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/13/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import Foundation

struct URLStringCreator {
    private init() {}
    
    static func createItuneURLString(ituneMediaComponent: ItuneMediaComponent, country: ItuneURLCountry, resultLimit: Int, allowExplicit: Bool) -> String? {
        return constructURLString(mediaType: ituneMediaComponent.mediaType, country: country, feedtype: ituneMediaComponent.feedTypeURLString, genre: ituneMediaComponent.genreURLString, resultLimit: resultLimit, allowExplicit: allowExplicit)
    }
    
    static private func constructURLString(mediaType: MediaType, country: ItuneURLCountry, feedtype: String, genre: String, resultLimit: Int, allowExplicit: Bool) -> String {
        let explicit = allowExplicit ? "explicit" : "non-explicit"
        let checkedResultLimit = resultLimit <= 100 ? resultLimit : 100
        return BaseURL.itunesRSS.rawValue + "\(country.rawValue)/\(mediaType.rawValue)/\(feedtype)/\(genre)/\(checkedResultLimit)/\(explicit).json"
    }
    
}
