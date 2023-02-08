//
//  MovieListViewModel.swift
//  TheMovieDB
//
//  Created by Nikhil yawalkar on 04/02/23.
//

import Foundation

class MovieListViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    let theMoviewDBService: TheMovieDBServiceProtocol
    
    init(theMoviewDBService: TheMovieDBServiceProtocol) {
        self.theMoviewDBService = theMoviewDBService
    }
    
    func getMovieData() {
        getData {}
    }
    
    func getData(completionHandler: @escaping () -> Void) {
        theMoviewDBService.getPopularMovies { [weak self] result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self?.movies = response?.movies ?? []
                    completionHandler()
                }
            case .failure(let error):
                completionHandler()
            }
        }
    }
}
