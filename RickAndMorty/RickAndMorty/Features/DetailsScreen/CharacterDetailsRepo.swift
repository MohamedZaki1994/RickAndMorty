//
//  CharacterDetailsRepo.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 23/10/2024.
//

import Foundation

protocol CharacterDetailsRepoProtocol {
	init(network: NetworkServiceProtocol)
	func fetchCharacter(id: Int) async throws -> CharacterDetailsModel
}

class CharacterDetailsRepo: CharacterDetailsRepoProtocol {
	var network: NetworkServiceProtocol
	
	required init(network: NetworkServiceProtocol = NetworkService()) {
		self.network = network
	}
	func fetchCharacter(id: Int) async throws -> CharacterDetailsModel {
		let target = CharacterTarget(endPoint: .singleCharacter(id: String(id)))
		return try await network.request(target: target)
	}
}
