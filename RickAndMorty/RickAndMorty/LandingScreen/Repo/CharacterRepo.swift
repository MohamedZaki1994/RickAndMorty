//
//  CharacterRepo.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 22/10/2024.
//

import Foundation

class CharacterRepo {
	var target = CharacterTarget()
	var network: NetworkService = NetworkService()
	
	func fetch(page: Int) async throws -> CharacterModel {
		target.page = page
		return try await network.request(target: target)
	}
}
