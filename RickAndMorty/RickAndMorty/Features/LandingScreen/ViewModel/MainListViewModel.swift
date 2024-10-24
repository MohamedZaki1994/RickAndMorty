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

protocol MainListViewModelProtocol {
	var repo: CharacterRepoProtocol {get}
	var model: CharacterModel? {get}
	var page: Int {get}
	var maxPage: Int? {get}
	var buttonTitles: [Status] {get}
	var status: String? {get}

	init(repo: CharacterRepoProtocol,
		 page: Int,
		 maxPage: Int?,
		 status: String?)
	func fetchData(tag: Int?) async throws
	func loadMore() async throws
}


@Observable
class MainListViewModel: MainListViewModelProtocol {
	var repo: CharacterRepoProtocol
	var model: CharacterModel?
	var page = 1
	var maxPage: Int?
	let buttonTitles = Status.allCases
	var status: String?
	
	required init(repo: CharacterRepoProtocol = CharacterRepo(),
		 page: Int = 1,
		 maxPage: Int? = nil,
		 status: String? = nil) {
		self.repo = repo
		self.model = model
		self.page = page
		self.maxPage = maxPage
		self.status = status
	}
	
	func fetchData(tag: Int? = nil) async throws {
		if let tag {
			page = 1
			guard status != buttonTitles[tag].rawValue.lowercased() else {return}
			status = buttonTitles[tag].rawValue.lowercased()
		}
		
		let batch = try await repo.fetch(page: nil, filter: self.status)
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
