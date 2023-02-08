//
//  MovieDetailViewModel.swift
//  TheMovieDB
//
//  Created by Nikhil yawalkar on 04/02/23.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    
    @Published var movieDetails: MovieDetails?
    let theMovieDBService: TheMovieDBServiceProtocol
    
    init(theMovieDBService: TheMovieDBServiceProtocol) {
        self.theMovieDBService = theMovieDBService
    }
    
    func getMoviewDetail(for movieId: Int) {
        getData(for: movieId, completionHandler: {})
    }
    
    func getData(for movieId: Int, completionHandler: @escaping () -> Void) {
        theMovieDBService.getMovieDetails(for: movieId) { [weak self] result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self?.movieDetails = response
                    completionHandler()
                }
            case .failure(let error):
                completionHandler()
            }
        }
    }
    
    var genresString: String {
        return movieDetails?.genres?.map({$0.name ?? ""}).joined(separator: " | ") ?? ""
    }
}
