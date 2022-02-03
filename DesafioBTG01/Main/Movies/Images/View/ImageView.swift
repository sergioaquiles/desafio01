//
//  ImageView.swift
//  DesafioBTG01
//
//  Created by Sergio Cardoso on 31/01/22.
//

import SwiftUI

struct ImageView: View {
	
	@StateObject var viewModel: ImageViewModel
	
	init(movie: Result) {
		_viewModel = StateObject(wrappedValue: ImageViewModel(movie: movie))
	}
	
	var body: some View {
		if let image = viewModel.imagePoster {
			Image(uiImage: image)
				.resizable()
				.scaledToFit()
				.cornerRadius(10)
				.padding()
        } else if viewModel.isLoading {
			ProgressView()
        } else {
            Image(systemName: "questionmark")
        }
	}
}

struct ImageView_Previews: PreviewProvider {
	static var previews: some View {
		ImageView(movie: dev.movie)
	}
}
