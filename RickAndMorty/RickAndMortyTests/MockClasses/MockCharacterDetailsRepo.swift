//
//  MockCharacterDetailsRepo.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 24/10/2024.
//

import Foundation
@testable import RickAndMorty

class MockCharacterDetailsRepo: CharacterDetailsRepoProtocol {
	let network: NetworkServiceProtocol
	
	required init(network: any NetworkServiceProtocol) {
		self.network = network
	}
	
	func fetchCharacter(id: Int) async throws -> CharacterDetailsModel {
		return try await network.request(target: MockTarget())
	}
	
}
