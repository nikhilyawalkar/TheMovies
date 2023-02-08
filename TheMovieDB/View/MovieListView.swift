//
//  SwiftUIView.swift
//  TheMovieDB
//
//  Created by Nikhil yawalkar on 03/02/23.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewModel = MovieListViewModel(theMoviewDBService: TheMovieDBService())
    
    var body: some View {
        NavigationStack {
            List($viewModel.movies){ movie in
                NavigationLink {
                    if let movieId = movie.wrappedValue.id {
                        MovieDetailView(movieId: movieId)
                    }
                } label: {
                    MovieRowView(movie: movie.wrappedValue)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .onAppear(perform: viewModel.getMovieData)
            .navigationTitle(Text("Popular Movies"))
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
