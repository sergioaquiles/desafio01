//
//  ImageViewModel.swift
//  DesafioBTG01
//
//  Created by Sergio Cardoso on 31/01/22.
//

import Foundation
import SwiftUI
import Combine

class ImageViewModel: ObservableObject {
	
	@Published var imagePoster: UIImage? = nil
    @Published var isLoading = false
	
	private let movie: Result
	private let dataService: ImageDataService
	private var cancellables = Set<AnyCancellable>()
	
	init(movie: Result) {
		self.movie = movie
		self.dataService = ImageDataService(movie: movie)
        self.isLoading = true
		addSubscribers()
	}
	
	func addSubscribers() {
		dataService.$moviePoster
			.sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (downloadedImage) in
				self?.imagePoster = downloadedImage
			}
			.store(in: &cancellables)
	}
}
