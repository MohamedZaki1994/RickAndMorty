//
//  CharacterDetailsRepo.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 23/10/2024.
//

import Foundation

class CharacterDetailsRepo {
	var network: NetworkService = NetworkService()
	
	func fetchCharacter(id: Int) async throws -> CharacterDetailsModel {
		let target = CharacterTarget(endPoint: .singleCharacter(id: String(id)))
		return try await network.request(target: target)
	}
}
