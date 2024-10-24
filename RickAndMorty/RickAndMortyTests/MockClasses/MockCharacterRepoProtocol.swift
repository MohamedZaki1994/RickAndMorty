//
//  MockCharacterRepoProtocol.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 24/10/2024.
//
import Foundation
@testable import RickAndMorty

class MockCharacterRepoProtocol: CharacterRepoProtocol {
	let network: NetworkServiceProtocol
	let target: CharacterTarget
	required init(target: CharacterTarget, network: any NetworkServiceProtocol) {
		self.target = target
		self.network = network
	}
	
	func fetch(page: Int?, filter: String?) async throws -> CharacterModel {
		return try await network.request(target: target)
	}	
}
