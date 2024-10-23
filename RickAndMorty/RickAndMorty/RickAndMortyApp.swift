//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 22/10/2024.
//

import SwiftUI

@main
struct RickAndMortyApp: App {
	
	
    var body: some Scene {
        WindowGroup {
			ContentView()
        }
    }
}

struct ContentView: View {
	@State private var navigateToSwiftUIView = false
	var body: some View {
		NavigationStack {
			MainListViewControllerRepresentable(navigateToSwiftUIView: $navigateToSwiftUIView)
				.navigationTitle("Characters")
				.navigationDestination(isPresented: $navigateToSwiftUIView) {
								Text("123")
							}
		}
	}
}
