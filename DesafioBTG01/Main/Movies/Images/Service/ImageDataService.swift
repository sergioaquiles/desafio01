//
//  ImageDataService.swift
//  DesafioBTG01
//
//  Created by Sergio Cardoso on 31/01/22.
// URL: https://image.tmdb.org/t/p/w500/

import Foundation
import SwiftUI
import Combine


class ImageDataService {
	
	@Published var moviePoster: UIImage? = nil
	private let movie: Result
	private let baseURL = "https://image.tmdb.org/t/p/"
	private let imageSize = "w500"
	private var imageSubscription: AnyCancellable?
	
	init(movie: Result) {
		
		self.movie = movie
		getPostImage()
	}

	func getPostImage() {
		
		guard let url = URL(string: "\(baseURL)\(imageSize)\(movie.posterPath)") else {return}
		imageSubscription = NetworkingManager.download(url: url)
			.tryMap({ (data) -> UIImage? in
				return UIImage(data: data)
			})
			.receive(on: DispatchQueue.main)
			.sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self](receivedImage) in
				guard let self = self, let downloadedImage = receivedImage else {return}
				self.moviePoster = downloadedImage
				self.imageSubscription?.cancel()
			})
	}
}
