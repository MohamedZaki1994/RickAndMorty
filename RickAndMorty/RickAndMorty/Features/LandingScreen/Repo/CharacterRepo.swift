//
//  CharacterRepo.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 22/10/2024.
//

import Foundation

protocol CharacterRepoProtocol {
	init(target: CharacterTarget, network: NetworkServiceProtocol)
	func fetch(page: Int?, filter: String?) async throws -> CharacterModel
}

class CharacterRepo: CharacterRepoProtocol {
	var target: CharacterTarget
	var network: NetworkServiceProtocol = NetworkService()
	required init(target: CharacterTarget = CharacterTarget(endPoint: .allCharacters),
		 network: NetworkServiceProtocol = NetworkService()) {
		self.network = network
		self.target = target
	}
	
	func fetch(page: Int? = nil,
			   filter: String? = nil) async throws -> CharacterModel {
		target.page = page
		target.status = filter
		return try await network.request(target: target)
	}
}
