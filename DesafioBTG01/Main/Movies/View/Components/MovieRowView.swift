//
//  MovieRowView.swift
//  DesafioBTG01
//
//  Created by Sergio Cardoso on 31/01/22.
//

import SwiftUI

struct MovieRowView: View {
	
	var movie: Result
    
	
	
	var body: some View {
		HStack(spacing: -20) {
            ZStack(alignment: .topTrailing) {
                ImageView(movie: movie)
                    .frame(width: 150, height: 150)
                .padding(.leading, -20)
                
                Image(systemName: "heart.fill")
                    .font(.system(size: 20))
                    .foregroundColor(.red)
                    .padding(.trailing, 25)
                    .padding(.top, 5)
                    .opacity(movie.isSetAsFavorite ? 1 : 0)
            }
			VStack(alignment: .leading) {
				Text("Title:")
					.font(.caption)
					.foregroundColor(.gray)
				Text(movie.originalTitle)
					.font(.headline)
				Text("Released date:")
					.font(.caption)
					.foregroundColor(.gray)
				Text(movie.releaseDate)
			}
            .padding(.trailing)
		}
	}
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView(movie: dev.movie)
            .previewLayout(.sizeThatFits)
    }
}
