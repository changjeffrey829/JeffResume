//
//  MediaTypeSettingViewModel.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/17/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

struct ItuneURLWrapper {
    let mediaType: MediaType
    var country: ItuneURLCountry
    var feedType: ItuneURLFeedType
    var genre: ItuneURLGenre
    var resultLimit: Int
    var allowExplicit: Bool
    
    
    init(mediaType: MediaType, country: ItuneURLCountry, resultLimit: Int, allowExplicit: Bool, feedType: ItuneURLFeedType, genre: ItuneURLGenre) {
        self.mediaType = mediaType
        self.country = country
        self.resultLimit = resultLimit
        self.allowExplicit = allowExplicit
        self.feedType = feedType
        self.genre = genre
    }
    
    func createItuneURLString() -> String {
        switch mediaType {
        case .movies:
            let feedType = self.feedType as? ItuneURLMoviesFeedType ?? ItuneURLMoviesFeedType.topMovies
            let genre = self.genre as? ItuneURLMoviesGenre ?? ItuneURLMoviesGenre.all
            return URLStringCreator.createMoviesAPI(country: country, feedType: feedType, genre: genre, resultLimit: resultLimit, allowExplicit: allowExplicit)
        case .podcasts:
            let feedType = self.feedType as? ItuneURLPodcastsFeedType ?? ItuneURLPodcastsFeedType.topPodcasts
            let genre = self.genre as? ItuneURLPodcastsGenre ?? ItuneURLPodcastsGenre.all
            return URLStringCreator.createPodcastsAPI(country: country, feedType: feedType, genre: genre, resultLimit: resultLimit, allowExplicit: allowExplicit)
        case .audiobooks:
            let feedType = self.feedType as? ItuneURLAudiobooksFeedType ?? ItuneURLAudiobooksFeedType.topAudiobooks
            let genre = self.genre as? ItuneURLAudiobooksGenre ?? ItuneURLAudiobooksGenre.all
            return URLStringCreator.createAudiobooksAPI(country: country, feedType: feedType, genre: genre, resultLimit: resultLimit, allowExplicit: allowExplicit)
        }
    }
}

class MediaTypeSettingViewModel: NSObject {
    static let cellID = "MediaTypeSettingTableViewCellID"
    let mediaType: MediaType
    var selectedMediaSetting: MediaSetting?
    let mediaSettingDatasource: [MediaSetting]
    var ituneURLWrapper: ItuneURLWrapper
    
    init(mediaType: MediaType, mediaSettingDatasource: [MediaSetting], ituneURLWrapper: ItuneURLWrapper) {
        self.mediaType = mediaType
        self.mediaSettingDatasource = mediaSettingDatasource
        self.ituneURLWrapper = ituneURLWrapper
        super.init()
    }
    
    func updateURLWrapper(selectedMediaSetting: MediaSetting, urlComponentString: String) {
        switch selectedMediaSetting {
        case .country:
            ituneURLWrapper.country = matchDisplayableCountryStringToURLComponent(urlComponentString)
        case .feedType:
            updateFeedType(urlComponentString: urlComponentString)
        case .genre:
            updateGenre(urlComponentString: urlComponentString)
        case .resultLimit:
            ituneURLWrapper.resultLimit = Int(urlComponentString) ?? 0
        case .allowExplicit:
            ituneURLWrapper.allowExplicit = urlComponentString == "Allow explicit" ? true : false
        }
    }
    
    private func updateGenre(urlComponentString: String) {
        switch mediaType {
        case .movies:
            ituneURLWrapper.genre = matchDisplayableMovieGenre(urlComponentString)
        case .podcasts:
            ituneURLWrapper.genre = matchDisplayablePodcastGenre(urlComponentString)
        case .audiobooks:
            ituneURLWrapper.genre = matchDisplayableAudiobookGenre(urlComponentString)
        }
    }
    
    private func matchDisplayableMovieGenre(_ urlComponentString: String) -> ItuneURLMoviesGenre {
        switch urlComponentString {
        case DisplayableMovieGenreString.all.rawValue:
            return ItuneURLMoviesGenre.all
        case DisplayableMovieGenreString.actionAndAdventure.rawValue:
            return ItuneURLMoviesGenre.actionAndAdventure
        case DisplayableMovieGenreString.documentary.rawValue:
            return ItuneURLMoviesGenre.documentary
        default:
            return ItuneURLMoviesGenre.all
        }
    }
    
    private func matchDisplayablePodcastGenre(_ urlComponentString: String) -> ItuneURLPodcastsGenre {
        switch urlComponentString {
        case DisplayablePodcastGenreString.all.rawValue:
            return ItuneURLPodcastsGenre.all
        default:
            return ItuneURLPodcastsGenre.all
        }
    }
    
    private func matchDisplayableAudiobookGenre(_ urlComponentString: String) -> ItuneURLAudiobooksGenre {
        switch urlComponentString {
        case DisplayableAudiobookGenreString.all.rawValue:
            return ItuneURLAudiobooksGenre.all
        default:
            return ItuneURLAudiobooksGenre.all
        }
    }
    
    private func updateFeedType(urlComponentString: String) {
        switch mediaType {
        case .movies:
            ituneURLWrapper.feedType = matchDisplayableMovieFeedTypeToURLComponent(urlComponentString)
        case .podcasts:
            ituneURLWrapper.feedType = matchDisplayablePodcastFeedToURLComponent(urlComponentString)
        case .audiobooks:
            ituneURLWrapper.feedType = matchingDisplayableAudiobookFeedToURLComponent(urlComponentString)
        }
    }
    
    private func matchDisplayableCountryStringToURLComponent(_ urlComponentString: String) -> ItuneURLCountry {
        switch urlComponentString {
        case DisplayableCountryString.unitedStates.rawValue:
            return ItuneURLCountry.unitedStates
        case DisplayableCountryString.unitedKingdom.rawValue:
            return ItuneURLCountry.unitedKingdom
        case DisplayableCountryString.japan.rawValue:
            return ItuneURLCountry.japan
        default:
            return ItuneURLCountry.unitedStates
        }
    }
    
    private func matchDisplayableMovieFeedTypeToURLComponent(_ string: String) -> ItuneURLMoviesFeedType {
        switch string {
        case DisplayableMovieFeedTypeString.topMovies.rawValue:
            return ItuneURLMoviesFeedType.topMovies
        default:
            return ItuneURLMoviesFeedType.topMovies
        }
    }
    
    private func matchDisplayablePodcastFeedToURLComponent(_ string: String) -> ItuneURLPodcastsFeedType {
        switch string {
        case DisplayablePodcastFeedTypeString.topPodcasts.rawValue:
            return ItuneURLPodcastsFeedType.topPodcasts
        default:
            return ItuneURLPodcastsFeedType.topPodcasts
        }
    }
    
    private func matchingDisplayableAudiobookFeedToURLComponent(_ string: String) -> ItuneURLAudiobooksFeedType {
        switch string {
        case DisplayableAudiobookFeedTypeString.topAudiobooks.rawValue:
            return ItuneURLAudiobooksFeedType.topAudiobooks
        default:
            return ItuneURLAudiobooksFeedType.topAudiobooks
        }
    }
}

enum DisplayableCountryString: String {
    case unitedStates = "United States"
    case unitedKingdom = "United Kingdom"
    case japan = "Japan"
}

enum DisplayableMovieFeedTypeString: String {
    case topMovies = "Top Movies"
}

enum DisplayablePodcastFeedTypeString: String {
    case topPodcasts = "Top Podcasts"
}

enum DisplayableAudiobookFeedTypeString: String {
    case topAudiobooks = "Top Audiobooks"
}

enum DisplayableMovieGenreString: String {
    case all = "All"
    case actionAndAdventure = "Action and Adventure"
    case documentary = "Documentary"
}

enum DisplayablePodcastGenreString: String {
    case all = "All"
}

enum DisplayableAudiobookGenreString: String {
    case all = "All"
}

extension MediaTypeSettingViewModel: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mediaSettingDatasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MediaTypeSettingViewModel.cellID, for: indexPath) as? MediaTypeSettingTableViewCell
        let pickerViewIndex = getMediaComponentPickerViewIndex(mediaSetting: mediaSettingDatasource[indexPath.row])
        cell?.viewModel = createMediaTypeSettingCellViewModel(index: indexPath.row, currentPickerViewIndex: pickerViewIndex)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    private func createMediaTypeSettingCellViewModel(index: Int, currentPickerViewIndex: Int) -> MediaTypeSettingCellViewModel {
        let mediaSetting = mediaSettingDatasource[index]
        let components = getMediaComponentStrings(mediaType: mediaType, mediaSetting: mediaSetting)
        return MediaTypeSettingCellViewModel(mediaType: mediaType, mediaSetting: mediaSetting, ituneURLComponents: components, currentIndex: currentPickerViewIndex)
    }
    
    private func getMediaComponentPickerViewIndex(mediaSetting: MediaSetting) -> Int {
        switch mediaSetting {
        case .country:
            let index = ItuneURLCountry.allValues.firstIndex(of: ituneURLWrapper.country)?.description ?? "0"
            return Int(index) ?? 0
        case .feedType:
            return 0
        case .genre:
            return 0
        case .resultLimit:
            return ituneURLWrapper.resultLimit - 1
        case .allowExplicit:
            return ituneURLWrapper.allowExplicit ? 0 : 1
        }
    }
    
    private func getMediaComponentStrings(mediaType: MediaType, mediaSetting: MediaSetting) -> [String] {
        var result = [String]()
        switch mediaSetting {
        case .country:
            for country in ItuneURLCountry.allValues {
                result.append(getCountryString(country: country))
            }
        case .feedType:
            result = getFeedTypeStrings(mediaType: mediaType)
        case .genre:
            result = getGenreString(mediaType: mediaType)
        case .resultLimit:
            for int in 1...100 {
                result.append(String(int))
            }
        case .allowExplicit:
            result.append("Allow explicit")
            result.append("No Explicit")
        }
        return result
    }
    
    private func getCountryString(country: ItuneURLCountry) -> String {
        switch country {
        case .japan:
         return "Japan"
        case .unitedKingdom:
            return "United Kingdom"
        case .unitedStates:
            return "United States"
        }
    }
    
    private func getFeedTypeStrings(mediaType: MediaType) -> [String] {
        var result = [String]()
        switch mediaType {
        case .movies:
            for feedType in ItuneURLMoviesFeedType.allValues {
                result.append(getMovieFeedTypeString(feedType: feedType))
            }
        case .podcasts:
            for feedType in ItuneURLPodcastsFeedType.allValues {
                result.append(getPodcastFeedTypeString(feedType: feedType))
            }
        case .audiobooks:
            for feedType in ItuneURLAudiobooksFeedType.allValues {
                result.append(getAudiobookFeedTypeString(feedType: feedType))
            }
        }
        return result
    }
    
    private func getMovieFeedTypeString(feedType: ItuneURLMoviesFeedType) -> String {
        switch feedType {
        case .topMovies:
            return DisplayableMovieFeedTypeString.topMovies.rawValue
        }
    }
    
    private func getPodcastFeedTypeString(feedType: ItuneURLPodcastsFeedType) -> String {
        switch feedType {
        case .topPodcasts:
            return DisplayablePodcastFeedTypeString.topPodcasts.rawValue
        }
    }
    
    private func getAudiobookFeedTypeString(feedType: ItuneURLAudiobooksFeedType) -> String {
        switch feedType {
        case .topAudiobooks:
            return DisplayableAudiobookFeedTypeString.topAudiobooks.rawValue
        }
    }
    
    private func getGenreString(mediaType: MediaType) -> [String] {
        var result = [String]()
        switch mediaType {
        case .movies:
            for genre in ItuneURLMoviesGenre.allValues {
                result.append(getMovieGenreString(genre: genre))
            }
        case .podcasts:
            for genre in ItuneURLPodcastsGenre.allValues {
                result.append(getPodcastGenreString(genre: genre))
            }
        case .audiobooks:
            for genre in ItuneURLAudiobooksGenre.allValues {
                result.append(getAudiobookGenreString(genre: genre))
            }
        }
        return result
    }
    
    private func getMovieGenreString(genre: ItuneURLMoviesGenre) -> String {
        switch genre {
        case .actionAndAdventure:
            return "Action and Adventure"
        case .all:
            return "All"
        case .documentary:
            return "Documentary"
        }
    }
    
    private func getPodcastGenreString(genre: ItuneURLPodcastsGenre) -> String {
        switch genre {
        case .all:
            return "All"
        }
    }
    
    private func getAudiobookGenreString(genre: ItuneURLAudiobooksGenre) -> String {
        switch genre {
        case .all:
            return "All"
        }
    }
}
