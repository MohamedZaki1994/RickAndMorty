//
//  CharacterDetailsViewModelTests.swift
//  RickAndMortyTests
//
//  Created by Mohamed Zaki on 22/10/2024.
//

import XCTest
@testable import RickAndMorty

final class RickAndMortyTests: XCTestCase {
	var viewModel: CharacterDetailsViewModel!
	
    override func setUpWithError() throws {
		let repo = MockCharacterDetailsRepo(network: MockDetailsNetworkService())
		viewModel = CharacterDetailsViewModel(repo: repo)
    }

    override func tearDownWithError() throws {
		viewModel = nil
    }

	func testCharacterDetails() async throws {
		try await viewModel.fetchCharacter(id: 0)
		let model = viewModel.model
		let mockedModel = CharacterDetailsModel(id: 6, status: "Alive", image: "", name: "Abadango Cluster Princess", gender: .female, species: .alien, location: Location(name: "Earth", url: ""))
		XCTAssertEqual(model, mockedModel)
    }
}
