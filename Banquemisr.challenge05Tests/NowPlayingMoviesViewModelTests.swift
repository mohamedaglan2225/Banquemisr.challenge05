//
//  Banquemisr_challenge05Tests.swift
//  Banquemisr.challenge05Tests
//
//  Created by Mohamed Aglan on 7/5/24.
//

import XCTest
import Combine

@testable import Banquemisr_challenge05

final class NowPlayingMoviesViewModelTests: XCTestCase {
    
    var viewModel: NowPlayingMoviesViewModel!
    var cancellables: Set<AnyCancellable>!
    
    override func setUpWithError() throws {
        super.setUp()
        viewModel = NowPlayingMoviesViewModel()
        cancellables = []
    }
    
    override func tearDown() {
        viewModel = nil
        cancellables = nil
        super.tearDown()
    }
    
    func testLoadingState() {
        let expectation = XCTestExpectation(description: "Loading state should be updated")
        
        var loadingStates = [Bool]()
        viewModel.isLoading
            .sink { isLoading in
                loadingStates.append(isLoading)
                if loadingStates.count == 2 {
                    XCTAssertEqual(loadingStates, [true, false])
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        viewModel.nowPlayingMoviesApi(page: 1)
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testErrorHandling() {
        let expectation = XCTestExpectation(description: "Error should be emitted")
        
        viewModel.errorPublisher
            .sink { error in
                XCTAssertNotNil(error)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        // Simulate an error scenario
        viewModel.nowPlayingMoviesApi(page: -1)
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testDataFetchingAndUpdating() {
        let expectation = XCTestExpectation(description: "Movies data should be updated")
        
        viewModel.nowPlayingMoviesModel
            .sink { movies in
                if movies.count > 0 {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        viewModel.nowPlayingMoviesApi(page: 1)
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testPaginationControl() {
        let expectation1 = XCTestExpectation(description: "First page load")
        let expectation2 = XCTestExpectation(description: "Next page load")
        
        // Set up the first expectation
        viewModel.isLoading
            .dropFirst()
            .sink { isLoading in
                if !isLoading {
                    expectation1.fulfill()
                }
            }
            .store(in: &cancellables)
        
        viewModel.nowPlayingMoviesApi(page: 1)
        
        wait(for: [expectation1], timeout: 5.0)
        XCTAssertEqual(viewModel.currentPageNumber, 1)
        
        // Set up the second expectation
        viewModel.isLoading
            .dropFirst()
            .sink { isLoading in
                if !isLoading {
                    expectation2.fulfill()
                }
            }
            .store(in: &cancellables)
        
        viewModel.loadNextPage()
        
        wait(for: [expectation2], timeout: 5.0)
        XCTAssertEqual(viewModel.currentPageNumber, 2)
    }

    
}
