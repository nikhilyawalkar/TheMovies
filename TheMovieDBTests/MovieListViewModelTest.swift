//
//  MovieListViewModelTest.swift
//  TheMovieDBTests
//
//  Created by Nikhil yawalkar on 09/02/23.
//

import XCTest
@testable import TheMovieDB

final class MovieListViewModelTest: XCTestCase {

    var viewModel: MovieListViewModel = MovieListViewModel(theMoviewDBService: TheMovieDBServiceMock())
    
    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {
        
    }

    func testGetData_success() {
        if let mockService = viewModel.theMoviewDBService as? TheMovieDBServiceMock {
            mockService.isForFailure = false
            let expection = self.expectation(description: "moviewdata")
            viewModel.getData {
                expection.fulfill()
            }
            waitForExpectations(timeout: 5, handler: nil)
            XCTAssertFalse(viewModel.movies.isEmpty)
        }
    }
    
    func testGetData_failure() {
        if let mockService = viewModel.theMoviewDBService as? TheMovieDBServiceMock {
            mockService.isForFailure = true
            let expection = self.expectation(description: "moviewdata")
            viewModel.getData {
                expection.fulfill()
            }
            waitForExpectations(timeout: 5, handler: nil)
            XCTAssertTrue(viewModel.movies.isEmpty)
        }
    }
}
