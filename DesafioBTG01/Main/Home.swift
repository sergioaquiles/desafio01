//
//  Home.swift
//  DesafioBTG01
//
//  Created by Sergio Cardoso on 30/01/22.
//

import SwiftUI

struct Home: View {
	
	var body: some View {
		
		TabView {
			MovieView()
				.tabItem {
					Label {Text("Movies")} icon: {Image(systemName: "film")}
				}
			FavoritesView()
				.tabItem {
					Label("Favorites", systemImage: "star")
				}
		}
	}
}

struct Home_Previews: PreviewProvider {
	static var previews: some View {
		Home()
			.environmentObject(MovieViewModel())
			.preferredColorScheme(.dark)
	}
}
