//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 23/10/2024.
//

import SwiftUI

struct ContentView: View {
	@State private var navigateToSwiftUIView = false
	@State private var id: Int?
	var body: some View {
		NavigationStack {
			MainListViewControllerRepresentable(characterId: $id)
				.navigationTitle("Characters")
				.navigationDestination(item: $id) { id in
					CharacterDetailsView(id: id)
				}
		}
	}
}
