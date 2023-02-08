//
//  MovieDetailViewModelTest.swift
//  TheMovieDBTests
//
//  Created by Nikhil yawalkar on 09/02/23.
//

import XCTest
@testable import TheMovieDB

final class MovieDetailViewModelTest: XCTestCase {

    let viewModel = MovieDetailViewModel(theMovieDBService: TheMovieDBServiceMock())
    
    override func setUpWithError() throws {
       
    }

    override func tearDownWithError() throws {
        
    }
    
    func testMoviewDetail_success() {
        if let mockService = viewModel.theMovieDBService as? TheMovieDBServiceMock {
            mockService.isForFailure = false
            let movieId = 1
            
            let expection = self.expectation(description: "movieDetail")
            viewModel.getData(for: movieId) {
                expection.fulfill()
            }
            waitForExpectations(timeout: 5, handler: nil)
            XCTAssertNotNil(viewModel.movieDetails)
        }
    }
    
    func testMoviewDetail_failure() {
        if let mockService = viewModel.theMovieDBService as? TheMovieDBServiceMock {
            mockService.isForFailure = true
            let movieId = 1
            
            let expection = self.expectation(description: "movieDetail")
            viewModel.getData(for: movieId) {
                expection.fulfill()
            }
            waitForExpectations(timeout: 5, handler: nil)
            XCTAssertNil(viewModel.movieDetails)
        }
    }

}
