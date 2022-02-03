//
//  Movies.swift
//  DesafioBTG01
//
//  Created by Sergio Cardoso on 30/01/22.
//

import Foundation
import SwiftUI

// MARK: - Welcome
struct Movies: Codable {
	let page: Int
	let results: [Result]
	let totalPages, totalResults: Int

	enum CodingKeys: String, CodingKey {
		case page, results
		case totalPages = "total_pages"
		case totalResults = "total_results"
	}
}

// MARK: - Result
struct Result: Codable, Identifiable {
	let adult: Bool
	let backdropPath: String
	let genreIDS: [Int]
	let id: Int
	let originalLanguage: OriginalLanguage
	let originalTitle, overview: String
	let popularity: Double
	let posterPath, releaseDate, title: String
	let video: Bool
	let voteAverage: Double
	let voteCount: Int
	var isFavorite: Bool?
    
    var isSetAsFavorite: Bool {
        get {
            isFavorite ?? false
        } set {
            isFavorite = newValue
        }
    }
	
	enum CodingKeys: String, CodingKey {
		case adult
		case backdropPath = "backdrop_path"
		case genreIDS = "genre_ids"
		case id
		case originalLanguage = "original_language"
		case originalTitle = "original_title"
		case overview, popularity
		case posterPath = "poster_path"
		case releaseDate = "release_date"
		case title, video
		case voteAverage = "vote_average"
		case voteCount = "vote_count"
		case isFavorite
	}
	
}

enum OriginalLanguage: String, Codable {
	case en = "en"
	case es = "es"
	case ja = "ja"
}

struct Genre: Codable {
	let id: Int
	let name: String
}
	


//"genres":[{"id":28,"name":"Action"},{"id":12,"name":"Adventure"},{"id":16,"name":"Animation"},{"id":35,"name":"Comedy"},{"id":80,"name":"Crime"},{"id":99,"name":"Documentary"},{"id":18,"name":"Drama"},{"id":10751,"name":"Family"},{"id":14,"name":"Fantasy"},{"id":36,"name":"History"},{"id":27,"name":"Horror"},{"id":10402,"name":"Music"},{"id":9648,"name":"Mystery"},{"id":10749,"name":"Romance"},{"id":878,"name":"Science Fiction"},{"id":10770,"name":"TV Movie"},{"id":53,"name":"Thriller"},{"id":10752,"name":"War"},{"id":37,"name":"Western"}]



