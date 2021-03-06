//
//  JeffResumeTests.swift
//  JeffResumeTests
//
//  Created by Jeffrey Chang on 1/11/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import XCTest
@testable import JeffResume

class NetworkServiceTests: XCTestCase {
    
    func testLoadMovieFromMockServer() {
        let mock = MockSession()
        let sut = NetworkService(session: mock)
        let MovieExpectation = XCTestExpectation(description: "wait for movie json objects")
        let mockMovieURLString = MockURLString.mockMovie.rawValue

        sut.loadMedia(urlString: mockMovieURLString) { (result) in
            switch result {
            case .failure(_):
                XCTFail()
                MovieExpectation.fulfill()
            case .success(let movies):
                let kind = movies.first?.kind == "movie" || movies.first?.kind == "movieBundle" ? true : false
                XCTAssert(kind, "kind needs to match podcast")
                XCTAssertEqual(10, movies.count)
                MovieExpectation.fulfill()
            }
        }
        wait(for: [MovieExpectation], timeout: 20)
    }
    
    func testLoadPodCastFromMockServer() {
        let mock = MockSession()
        let sut = NetworkService(session: mock)
        let podcastExpectation = XCTestExpectation(description: "wait for podcast json objects")
        let mockPodcastURLString = MockURLString.mockPodcast.rawValue

        sut.loadMedia(urlString: mockPodcastURLString) { (result) in
            switch result {
            case .failure(_):
                XCTFail()
                podcastExpectation.fulfill()
            case .success(let podcasts):
                let kind = podcasts.first?.kind == "podcast" ? true : false
                XCTAssert(kind, "kind needs to match podcast")
                XCTAssertEqual(10, podcasts.count)
                podcastExpectation.fulfill()
            }
        }
        wait(for: [podcastExpectation], timeout: 20)
    }
    
    func testLoadAudiobooksFromMockServer() {
        let mock = MockSession()
        let sut = NetworkService(session: mock)
        let audiobookExpectation = XCTestExpectation(description: "wait for audiobook json objects")
        let mockAudiobookURLString = MockURLString.mockAudiobook.rawValue
        sut.loadMedia(urlString: mockAudiobookURLString) { (result) in
            switch result {
            case .failure(_):
                XCTFail()
                audiobookExpectation.fulfill()
            case .success(let podcasts):
                let kind = podcasts.first?.kind == "book" ? true : false
                XCTAssert(kind, "kind needs to match book")
                XCTAssertEqual(10, podcasts.count)
                audiobookExpectation.fulfill()
            }
        }
        wait(for: [audiobookExpectation], timeout: 20)
    }
    
    func testErrorLoadMediaFromServer() {
        let mock = MockErrorSession()
        let sut = NetworkService(session: mock)
        sut.loadMedia(urlString: "") { (result) in
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, MediaLoadingError.mediaError)
            case .success(_):
                XCTFail()
            }
        }
    }

}
