//
//  Banquemisr_challenge05Tests.swift
//  Banquemisr.challenge05Tests
//
//  Created by Mohamed Aglan on 7/5/24.
//

import XCTest
import Combine
@testable import Banquemisr_challenge05

final class Banquemisr_challenge05Tests: XCTestCase {
    
//    var viewModel: NowPlayingMoviesViewModel!
//    var mockService: MockNowPlayingMoviesService!
//    
    override func setUpWithError() throws {
        super.setUp()
//        mockService = MockNowPlayingMoviesService()
//        viewModel = NowPlayingMoviesViewModel(service: mockService)
    }
    
    func testNowPlayingMoviesSuccess() async throws {
        
//        let result = NowPlayingModelResult(
//            adult: false,
//            backdropPath: nil,
//            genreIDS: [],
//            id: 1,
//            originalLanguage: "en",
//            originalTitle: "Test Movie",
//            overview: "Overview of the movie",
//            popularity: 1.0,
//            posterPath: "path/to/poster",
//            releaseDate: "2024-07-06",
//            title: "Test Movie",
//            video: false,
//            voteAverage: 7.0,
//            voteCount: 100
//        )
//        
//        let results = [result]
//        let model = NowPlayingModel(page: 1, results: results, totalPages: 2, totalResults: 1)
//        mockService.mockData = model
//        
//        viewModel.nowPlayingMoviesApi(page: 1)
//        
//        var loadStates: [Bool] = []
//        var subscriptions = Set<AnyCancellable>()
//        let loadingSubscription = viewModel.isLoading.sink { isLoading in
//            loadStates.append(isLoading)
//        }
//        
//        // Use XCTestExpectation to wait for the async operation to complete
//        let expectation = XCTestExpectation(description: "Loading movies")
//        viewModel.isLoading.sink { isLoading in
//            if !isLoading {
//                expectation.fulfill()
//            }
//        }.store(in: &subscriptions)  // Assuming you have a subscriptions Set<AnyCancellable>
//        
//        // Wait for the expectation to be fulfilled
//        wait(for: [expectation], timeout: 5.0)
//        
//        XCTAssertEqual(loadStates, [true, false], "Loading state should be handled correctly")
//        XCTAssertEqual(viewModel.nowPlayingMoviesModel.value.count, 1, "Should have loaded one movie")
//        XCTAssertFalse(viewModel.isLastPage, "Should not be the last page")
//        
//        loadingSubscription.cancel()
    }
    
    func testNowPlayingMoviesFailure() async throws {
//        mockService.error = NSError(domain: "", code: -1, userInfo: nil)
//        
//        viewModel.nowPlayingMoviesApi(page: 1)
//        
//        var errors: [Error] = []
//        let errorSubscription = viewModel.errorPublisher.sink(receiveValue: { error in
//            errors.append(error)
//        })
//        
//        await Task.sleep(1 * NSEC_PER_SEC)  // Wait for async task to complete
//        
//        XCTAssertFalse(errors.isEmpty, "Should have received an error")
//        errorSubscription.cancel()
    }
    
}
