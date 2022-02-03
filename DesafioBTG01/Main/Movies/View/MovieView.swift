//
//  MovieView.swift
//  DesafioBTG01
//
//  Created by Sergio Cardoso on 30/01/22.
//

import SwiftUI

struct MovieView: View {
    
    @EnvironmentObject var viewModel: MovieViewModel
    @State private var showDetail = false
    @State private var searchText = ""
    @State private var isFavorite = false
    
    
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 0) {
                SearchBarView(text: $searchText, placeHolder: "Which movie are you looking for ?")
                List {
                    ForEach(viewModel.allMovies.filter({"\($0.originalTitle)".contains(searchText) || searchText.isEmpty})) { movie in
                        
                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                            MovieRowView(movie: movie)
                        }
                    }
                    .navigationTitle("Movies 🎥")
                }
                .refreshable {
                    viewModel.dataService.getMovies()
                }
            }
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
            .environmentObject(MovieViewModel())
            .preferredColorScheme(.dark)
    }
}


