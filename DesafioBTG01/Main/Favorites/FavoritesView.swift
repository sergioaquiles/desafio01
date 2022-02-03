//
//  FavoritesView.swift
//  DesafioBTG01
//
//  Created by Sergio Cardoso on 03/02/22.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var viewModel: MovieViewModel
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBarView(text: $searchText, placeHolder: "What movie are you looking for?")
                List {
                    if viewModel.favoriteMovies.isEmpty {
                        Text("You don't have any favorites yet 🙄")
                    }
                    ForEach(viewModel.favoriteMovies.filter({"\($0.originalTitle)".contains(searchText) || "\($0.releaseDate)".contains(searchText) || searchText.isEmpty})) { movie in
                        
                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                            MovieRowView(movie: movie)
                        }
                    }
                }.navigationTitle("Favorites 🎬 🍿")
               
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(MovieViewModel())
            .preferredColorScheme(.dark)
    }
}
