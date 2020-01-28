//
//  MediaTypeSettingViewModel.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/17/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

class MediaTypeSettingViewModel: NSObject {
    
    // MARK: - PROPERTIES
    static let cellID = "MediaTypeSettingTableViewCellID"
    let mediaType: MediaType
    var selectedMediaSetting: MediaSetting?
    let mediaSettingDatasource: [MediaSetting]
    var ituneURLWrapper: ItuneURLWrapper
    
    // MARK: - LIFE CYCLE
    init(mediaType: MediaType, mediaSettingDatasource: [MediaSetting], ituneURLWrapper: ItuneURLWrapper) {
        self.mediaType = mediaType
        self.mediaSettingDatasource = mediaSettingDatasource
        self.ituneURLWrapper = ituneURLWrapper
        super.init()
    }
    
    // MARK: - PUBLIC METHOD
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
    
    // MARK: - PRIVATE METHOD
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
    
    private func matchDisplayableMovieGenre(_ displayableString: String) -> ItuneURLMoviesGenre {
        switch displayableString {
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
    
    private func matchDisplayablePodcastGenre(_ displayableString: String) -> ItuneURLPodcastsGenre {
        switch displayableString {
        case DisplayablePodcastGenreString.all.rawValue:
            return ItuneURLPodcastsGenre.all
        default:
            return ItuneURLPodcastsGenre.all
        }
    }
    
    private func matchDisplayableAudiobookGenre(_ displayableString: String) -> ItuneURLAudiobooksGenre {
        switch displayableString {
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
    
    private func matchDisplayableCountryStringToURLComponent(_ displayableString: String) -> ItuneURLCountry {
        switch displayableString {
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
                result.append(ItuneDisplayableStringConverter.getCountryString(country: country))
            }
        case .feedType:
            result = ItuneDisplayableStringConverter.getFeedTypeStrings(mediaType: mediaType)
        case .genre:
            result = ItuneDisplayableStringConverter.getGenreString(mediaType: mediaType)
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
}
