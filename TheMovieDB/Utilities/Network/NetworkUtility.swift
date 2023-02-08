//
//  NetworkUtility.swift
//  TheMovieDB
//
//  Created by Nikhil yawalkar on 03/02/23.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

class NetworkUtility {
   
    func getData<T: Decodable>(requestUrl:URL, resultType: T.Type, completionHandler: @escaping (Result<T?, Error>) -> Void) {
        var urlRrquest = URLRequest(url: requestUrl)
        urlRrquest.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: urlRrquest) { data, urlResponse, error in
            guard let data = data else {
                completionHandler(.failure(error!))
                return
            }
            
            if let result = try? JSONDecoder().decode(T.self, from: data) {
                completionHandler(.success(result))
            }
        }.resume()
    }
    
    
    func getDummy<T: Decodable>(requestUrl:URL, resultType: T.Type, completionHandler: @escaping (Result<T?, Error>) -> Void) {
        let movieResponse = Bundle.main.path(forResource: "themoviedb", ofType: "json")
        let moviesData = try? Data(contentsOf: URL(fileURLWithPath: movieResponse!), options: .alwaysMapped)
        let movies = try? JSONDecoder().decode(T.self, from: moviesData!)
        completionHandler(.success(movies))
    }
    
    func getDummyMoviewDetail<T: Decodable>(requestUrl:URL, resultType: T.Type, completionHandler: @escaping (Result<T?, Error>) -> Void) {
        
    }
}
