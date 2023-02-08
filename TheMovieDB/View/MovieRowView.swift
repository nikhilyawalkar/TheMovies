//
//  MovieRowView.swift
//  TheMovieDB
//
//  Created by Nikhil yawalkar on 03/02/23.
//

import SwiftUI

struct MovieRowView: View {
    let movie: Movie
    
    var body: some View {
        LazyImage(imageUrl: "https://image.tmdb.org/t/p/original\(movie.posterPath ?? "")")
            .clipShape(
                RoundedRectangle(cornerRadius: 16)
            )
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView(movie: Movie(adult: false, backdropPath: "", genreIDS: [], id: 0, originalLanguage: OriginalLanguage.en, originalTitle: "", overview: "", popularity: 1.0, posterPath: "", releaseDate: "", title: "", video: true, voteAverage: 1.0, voteCount: 1))
    }
}
