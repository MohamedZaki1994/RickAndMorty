//
//  CharacterTarget.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 22/10/2024.
//

import Foundation

class CharacterTarget: TargetProtocol {
	var path: String = "/api/character"
	var page: Int = 1
	var queryParams: [String: String?]? {
		let page = String(page)
		return ["page": page]
	}
}
