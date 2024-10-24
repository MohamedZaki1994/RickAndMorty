//
//  CharacterDetailsViewModel.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 23/10/2024.
//

import Foundation

protocol CharacterDetailsViewModelProtocol {
	var model: CharacterDetailsModel? { get }
	var repo: CharacterDetailsRepoProtocol { get }
	
	init(repo: CharacterDetailsRepoProtocol)
	func fetchCharacter(id: Int) async throws
}

@Observable
class CharacterDetailsViewModel: CharacterDetailsViewModelProtocol {
	var model: CharacterDetailsModel?
	let repo: CharacterDetailsRepoProtocol
	
	required init(repo: CharacterDetailsRepoProtocol = CharacterDetailsRepo()) {
		self.repo = repo
	}
	
	func fetchCharacter(id: Int) async throws {
		model = try await repo.fetchCharacter(id: id)
	}
}
