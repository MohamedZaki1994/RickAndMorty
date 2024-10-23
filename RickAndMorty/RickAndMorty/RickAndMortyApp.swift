//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 22/10/2024.
//

import SwiftUI
import Kingfisher

@main
struct RickAndMortyApp: App {
	
	init() {
		let cache = ImageCache.default
		cache.memoryStorage.config.totalCostLimit = 1024 * 1024 * 30
	}
	
    var body: some Scene {
        WindowGroup {
			ContentView()
        }
    }
}
