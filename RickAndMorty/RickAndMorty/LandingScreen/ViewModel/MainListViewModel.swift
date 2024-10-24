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
	let buttonTitles = Status.allCases
	var status: String?
	
	func fetchData(tag: Int? = nil) async throws {
		if let tag {
			page = 1
			guard status != buttonTitles[tag].rawValue.lowercased() else {return}
			status = buttonTitles[tag].rawValue.lowercased()
		}
		
		let batch = try await repo.fetch(filter: self.status)
		maxPage = batch.info.pages
		model = batch
	}
	
	func loadMore() async throws {
		page += 1
		if let maxPage,
		   page > maxPage {
			throw CustomError.pageLimit
		}
		let batch = try await repo.fetch(page: page, filter: self.status)
		if let oldModel = model {
			let allResults = oldModel.results + batch.results
			model = CharacterModel(info: oldModel.info, results: allResults)
		}
		
	}
}
