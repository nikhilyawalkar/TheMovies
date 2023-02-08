//
//  NetworkConstants.swift
//  TheMovieDB
//
//  Created by Nikhil yawalkar on 07/02/23.
//

import Foundation

struct NetworkConstants {
    private let baseUrl: String = "https://api.themoviedb.org/3/movie/"
    private let apiKey = "e23a3b617b6235b4520e272c8a4c4f4d"
    private let imageBaseUrl = "https://image.tmdb.org/t/p/original"
    private let popularMovieEndPoint = "popular"
    
    
    func getPopularMoviesAPIUrl() -> String {
        return "\(baseUrl)\(popularMovieEndPoint)"
    }
    
    func getMovieDetailAPIUrl(for movieId: Int) -> String {
        return "\(baseUrl)\(movieId)"
    }
    
    func getBaseQueryParam() -> [String: String] {
        return ["api_key": apiKey]
    }
}


struct URLBuilder {
    func getURL(for urlString: String, byAdding queryParam: [String: String]) -> URL? {
        var urlComponent = URLComponents(string: urlString)
        var queryItems = [URLQueryItem]()
        for (key, value) in queryParam {
            let queryItem = URLQueryItem(name: key, value: value)
            queryItems.append(queryItem)
        }
        urlComponent?.queryItems = queryItems
        return urlComponent?.url
    }
}
