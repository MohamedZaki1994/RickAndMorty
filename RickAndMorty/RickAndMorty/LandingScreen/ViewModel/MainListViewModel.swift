//
//  MainListViewModel.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 22/10/2024.
//

import Foundation

enum CustomError: Error {
	case pageLimit
}

@Observable
class MainListViewModel {
	var repo = CharacterRepo()
	var model: CharacterModel?
	var page = 1
	var maxPage: Int?
	
	func fetchData() async throws {
		if let maxPage,
		   page > maxPage {
			throw CustomError.pageLimit
		}
		let batch = try await repo.fetch(page: page)
		maxPage = batch.info.pages
		if let oldModel = model {
			let allResults = oldModel.results + batch.results
			model = CharacterModel(info: oldModel.info, results: allResults)
		} else {
			model = batch
		}
		page += 1
	}
}
