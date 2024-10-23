//
//  CharacterDetailsViewModel.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 23/10/2024.
//

import Foundation

@Observable
class CharacterDetailsViewModel {
	var model: CharacterDetailsModel?
	let repo = CharacterDetailsRepo()
	
	func fetchCharacter(id: Int) async throws {
		model = try await repo.fetchCharacter(id: id)
	}
}
