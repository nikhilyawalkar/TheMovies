//
//  MovieDetailView.swift
//  TheMovieDB
//
//  Created by Nikhil yawalkar on 04/02/23.
//

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var movieDetailViewModel = MovieDetailViewModel(theMovieDBService: TheMovieDBService())
    
    let movieId: Int
    
    var body: some View {
        VStack(alignment: .center) {
            
            LazyImage(imageUrl: "https://image.tmdb.org/t/p/original\(movieDetailViewModel.movieDetails?.posterPath ?? "")")
                .frame(width: 300, height: 300)
            
            Text(movieDetailViewModel.movieDetails?.title ?? "")
                .font(.title)
            
            Text(movieDetailViewModel.genresString)
                .font(.caption2)

            
            HStack {
                Text("Overview")
                    .font(.title3)
                .padding(.top)
                
                Spacer()
            }
            
            Text(movieDetailViewModel.movieDetails?.overview ?? "")
                .font(.footnote)
                .foregroundColor(.gray)
            
            Spacer()
            
        }
        .padding()
        .onAppear(perform: {
            movieDetailViewModel.getMoviewDetail(for: movieId)
        })
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieId: 12345)
    }
}
