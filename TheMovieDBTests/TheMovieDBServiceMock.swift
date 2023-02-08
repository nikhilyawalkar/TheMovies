//
//  TheMovieDBServiceMock.swift
//  TheMovieDBTests
//
//  Created by Nikhil yawalkar on 08/02/23.
//

import Foundation
@testable import TheMovieDB

enum CustomError: Error {
    case randomError
}
class TheMovieDBServiceMock: TheMovieDBServiceProtocol {
    
    var isForFailure: Bool = false
    
    func getPopularMovies(completionHandler: @escaping (Result<PopularMovieResponse?, Error>) -> Void) {
        if !isForFailure {
            let bundle = Bundle(for: type(of: self))
            let movieResponse = bundle.path(forResource: "themoviedb", ofType: "json")
            let moviesData = try? Data(contentsOf: URL(fileURLWithPath: movieResponse!), options: .alwaysMapped)
            let movies = try? JSONDecoder().decode(PopularMovieResponse.self, from: moviesData!)
            completionHandler(.success(movies))
        } else {
            completionHandler(.failure(CustomError.randomError))
        }
    }
    
    func getMovieDetails(for movieId: Int, completionHandler: @escaping (Result<MovieDetails?, Error>) -> Void) {
        if !isForFailure {
            let bundle = Bundle(for: type(of: self))
            let movieResponse = bundle.path(forResource: "MovieDetail", ofType: "json")
            let moviesData = try? Data(contentsOf: URL(fileURLWithPath: movieResponse!), options: .alwaysMapped)
            let movies = try? JSONDecoder().decode(MovieDetails.self, from: moviesData!)
            completionHandler(.success(movies))
        } else {
            completionHandler(.failure(CustomError.randomError))
        }
    }
}
