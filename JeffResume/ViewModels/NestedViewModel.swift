//
//  NestedCollectionViewModel.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/14/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

class NestedViewModel: NSObject {
    
    //MARK:- PROPERTIES
    private let cellHeight: CGFloat = 150
    private let mediaTypes: [MediaType]
    let cellID = "tableCellID"
    var ituneURLWrappersDict = [MediaType : ItuneURLWrapper]()
    var tableViewIndexRequireUpdate: Int?
    
    //MARK:- LIFE CYCLE
    init(mediaTypes: [MediaType]) {
        self.mediaTypes = mediaTypes
    }
    
    //MARK:- PRIVATE METHODS
    private func defaultURLString(mediaType: MediaType) -> String {
        switch mediaType {
        case .movies:
            let feedType = ItuneURLMoviesFeedType.topMovies as ItuneURLFeedType
            let genre = ItuneURLMoviesGenre.all as ItuneURLGenre
            let urlWrapper = ItuneURLWrapper(mediaType: .movies, country: .unitedStates, resultLimit: 10, allowExplicit: true, feedType: feedType, genre: genre)
            ituneURLWrappersDict[.movies] = urlWrapper
            return urlWrapper.createItuneURLString()
        case .podcasts:
            let feedType = ItuneURLPodcastsFeedType.topPodcasts as ItuneURLFeedType
            let genre = ItuneURLPodcastsGenre.all as ItuneURLGenre
            let urlWrapper = ItuneURLWrapper(mediaType: .podcasts, country: .unitedStates, resultLimit: 10, allowExplicit: true, feedType: feedType, genre: genre)
            ituneURLWrappersDict[.podcasts] = urlWrapper
            return urlWrapper.createItuneURLString()
        case .audiobooks:
            let feedType = ItuneURLAudiobooksFeedType.topAudiobooks as ItuneURLFeedType
            let genre = ItuneURLAudiobooksGenre.all as ItuneURLGenre
            let urlWrapper = ItuneURLWrapper(mediaType: .audiobooks, country: .unitedStates, resultLimit: 10, allowExplicit: true, feedType: feedType, genre: genre)
            ituneURLWrappersDict[.audiobooks] = urlWrapper
            return urlWrapper.createItuneURLString()
        }
    }
}

//MARK:- TABLEVIEW DATASOURCE AND DELEGATE
extension NestedViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediaTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? NestedTableViewCell
        cell?.selectionStyle = .none
        let mediaType = mediaTypes[indexPath.row]
        let ituneURLObject = ituneURLWrappersDict[mediaType]
        let urlstring = ituneURLObject?.createItuneURLString() ?? defaultURLString(mediaType: mediaType)
        let vm = NestedTableCellViewModel(mediaType: mediaType, urlString: urlstring)
        cell?.viewModel = vm
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}

//MARK:- MediaSettingVCDelegate
extension NestedViewModel: MediaSettingVCDelegate {
    func ituneURLWrapperUpdated(wrapper: ItuneURLWrapper) {
        ituneURLWrappersDict[wrapper.mediaType] = wrapper
        let index = mediaTypes.firstIndex(of: wrapper.mediaType)
        tableViewIndexRequireUpdate = index
    }
}
