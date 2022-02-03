//
//  DesafioBTG01App.swift
//  DesafioBTG01
//
//  Created by Sergio Cardoso on 30/01/22.
//

import SwiftUI

@main
struct DesafioBTG01App: App {
	
	@StateObject var viewModel = MovieViewModel()
	
	var body: some Scene {
		WindowGroup {
			Home()
				.environmentObject(MovieViewModel())
				.preferredColorScheme(.dark)
		}
	}
}
