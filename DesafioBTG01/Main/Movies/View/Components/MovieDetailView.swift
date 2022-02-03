//
//  MovieDetailView.swift
//  DesafioBTG01
//
//  Created by Sergio Cardoso on 31/01/22.
//

import SwiftUI

struct MovieDetailView: View {
    
    @EnvironmentObject var viewModel: MovieViewModel
    var movie: Result
    
    var movieIndex: Int {
        viewModel.allMovies.firstIndex(where: { $0.id == movie.id })!
    }
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ImageView(movie: movie)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Rating:")
                            .foregroundColor(.gray)
                        Text(String(movie.voteAverage))
                            .foregroundColor(movie.voteAverage > 6 ? .green : .red)
                        Spacer()
                        
                        FavoriteButton(isSet: $viewModel.allMovies[movieIndex].isSetAsFavorite)
                    }
                    .padding(.horizontal)
                    
                    Text("Title:")
                        .foregroundColor(.gray)
                        .padding(.leading)
                    
                    Text(movie.originalTitle)
                        .font(.system(size: 30, weight: .semibold, design: .rounded))
                        .padding(.leading)
                    
                    Text("Overview:")
                        .foregroundColor(.gray)
                        .padding(.leading)
                        .padding(.top, -10)
                    
                    Text(movie.overview)
                        .font(.footnote)
                        .padding(.horizontal)
                }
                
                
                Spacer()
            }
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: dev.movie)
            .environmentObject(MovieViewModel())
            .preferredColorScheme(.dark)
    }
}
