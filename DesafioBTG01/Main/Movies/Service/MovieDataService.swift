//
//  MovieDataService.swift
//  DesafioBTG01
//
//  Created by Sergio Cardoso on 30/01/22.
//

import Foundation
import Combine



class MovieDataService {
	
	@Published var allMovies = [Result]()
	var movieSubscription: AnyCancellable?
	
	init() {
		getMovies()
	}
	
	func getMovies() {
        
		guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=e5ffd2f8681389db48c56ac78adfb8c3&language=en-US&page=1") else {return}
		movieSubscription = NetworkingManager.download(url: url)
			.decode(type: Movies.self, decoder: JSONDecoder())
			.receive(on: DispatchQueue.main)
			.sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] movie in
				self?.allMovies = movie.results
				self?.movieSubscription?.cancel()
			})
	}
}
