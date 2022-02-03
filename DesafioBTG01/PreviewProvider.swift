//
//  PreviewProvider.swift
//  DesafioBTG01
//
//  Created by Sergio Cardoso on 31/01/22.
//

import Foundation
import SwiftUI


extension PreviewProvider {
	
	static var dev: DeveloperPreview {
		return DeveloperPreview.instance
	}
	
}

class DeveloperPreview {
	
	static let instance = DeveloperPreview()
	
	private init() { }
	
	let movieVM = MovieViewModel()
	let movie = Result(adult: false,
					   backdropPath: "/iQFcwSGbZXMkeyKrxbPnwnRo5fl.jpg",
					   genreIDS: [28, 12, 878],
					   id: 634649,
					   originalLanguage: .en,
					   originalTitle: "Spider-Man: No Way Home",
					   overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.",
					   popularity: 27440.873,
					   posterPath: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
					   releaseDate: "2021-12-15",
					   title: "Spider-Man: No Way Home",
					   video: false,
					   voteAverage: 8.4,
					   voteCount: 6446, isFavorite: false)
}

/*
 adult: false
 backdrop_path: "/iQFcwSGbZXMkeyKrxbPnwnRo5fl.jpg"
 genre_ids: [28, 12, 878]
 id:	634649
 original_language: "en"
 original_title: "Spider-Man: No Way Home"
 overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man."
 popularity: 27440.873
 poster_path: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg"
 release_date: "2021-12-15"
 title: "Spider-Man: No Way Home"
 video: false
 vote_average: 8.4
 vote_count: 6446
 */
