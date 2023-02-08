//
//  TheMoviewDBServices.swift
//  TheMovieDB
//
//  Created by Nikhil yawalkar on 07/02/23.
//

import Foundation

protocol TheMovieDBServiceProtocol {
    func getPopularMovies(completionHandler: @escaping (Result<PopularMovieResponse?, Error>) -> Void)
    func getMovieDetails(for movieId: Int, completionHandler: @escaping (Result<MovieDetails?, Error>) -> Void)
}

class TheMovieDBService: TheMovieDBServiceProtocol {
    
    func getPopularMovies(completionHandler: @escaping (Result<PopularMovieResponse?, Error>) -> Void) {
        let urlString = NetworkConstants().getPopularMoviesAPIUrl()
        guard let url = URLBuilder().getURL(for: urlString, byAdding: NetworkConstants().getBaseQueryParam()) else {
            return
        }
        
        NetworkUtility().getData(requestUrl: url, resultType: PopularMovieResponse.self) { result in
            completionHandler(result)
        }
    }
    
    func getMovieDetails(for movieId: Int, completionHandler: @escaping (Result<MovieDetails?, Error>) -> Void) {
        let urlString = NetworkConstants().getMovieDetailAPIUrl(for: movieId)
        guard let url = URLBuilder().getURL(for: urlString, byAdding: NetworkConstants().getBaseQueryParam()) else {
            return
        }
        
        NetworkUtility().getData(requestUrl: url, resultType: MovieDetails.self) { result in
            completionHandler(result)
        }
    }
    
}
