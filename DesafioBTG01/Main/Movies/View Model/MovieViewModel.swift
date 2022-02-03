//
//  MovieViewModel.swift
//  DesafioBTG01
//
//  Created by Sergio Cardoso on 30/01/22.
//

import Foundation
import Combine
import SwiftUI

class MovieViewModel: ObservableObject {
	
	@Published var allMovies = [Result]()
    @Published var favoriteMovies = [Result]()
    
    let dataService = MovieDataService()
	private var cancellables = Set<AnyCancellable>()
	
	init() {
		addSubscribers()
	}
    
	func addSubscribers() {
		dataService.$allMovies
			.sink { [weak self] (returnedMovies) in
				self?.allMovies = returnedMovies
			}
			.store(in: &cancellables)
        
        $allMovies
            .map(filterFavoritMovies)
            .sink { [weak self] (favorites) in
                self?.favoriteMovies = favorites
            }
            .store(in: &cancellables)
        
        
	}
    
    func filterFavoritMovies(allMovies: [Result]) -> [Result] {
        return allMovies.filter({$0.isFavorite == true})
    }
    
    
}
