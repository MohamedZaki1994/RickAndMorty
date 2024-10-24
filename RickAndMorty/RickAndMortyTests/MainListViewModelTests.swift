//
//  MainListViewModelTests.swift
//  RickAndMortyTests
//
//  Created by Mohamed Zaki on 24/10/2024.
//

import XCTest
@testable import RickAndMorty

final class MainListViewModelTests: XCTestCase {
	var viewModel: MainListViewModel!
	
    override func setUpWithError() throws {
		let target = CharacterTarget(endPoint: .allCharacters)
		let repo = MockCharacterRepoProtocol(target: target, network: MockNetworkService())
		viewModel = MainListViewModel(repo: repo)
    }

    override func tearDownWithError() throws {
		viewModel = nil
    }

	func testAllChracters() async throws {
		try await viewModel.fetchData()
		let model = viewModel.model
		let result: [Result] = [Result(id: 1, name: "Rick Sanchez", status: .alive, species: .human, gender: .male, location: Location(name: "Citadel of Ricks", url: ""), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: [], url: "", created: ""),
								Result(id: 2, name: "Morty Smith", status: .alive, species: .human, gender: .male, location: Location(name: "Citadel of Ricks", url: ""), image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg", episode: [], url: "", created: "")]
		let mockedModel = CharacterModel(info: Info(count: 826, pages: 42, next: nil), results: result)
		
		XCTAssertEqual(model, mockedModel)
    }
}




