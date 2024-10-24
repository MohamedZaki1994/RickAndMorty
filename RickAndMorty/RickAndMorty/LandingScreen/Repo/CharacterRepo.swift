//
//  CharacterRepo.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 22/10/2024.
//

import Foundation

class CharacterRepo {
	var target: CharacterTarget
	var network: NetworkService = NetworkService()
	init() {
		target = CharacterTarget(endPoint: .allCharacters)
	}
	
	func fetch(page: Int? = nil,
			   filter: String? = nil) async throws -> CharacterModel {
		target.page = page
		target.status = filter
		return try await network.request(target: target)
	}
}
