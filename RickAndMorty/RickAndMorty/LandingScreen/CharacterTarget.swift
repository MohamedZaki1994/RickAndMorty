//
//  CharacterTarget.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 22/10/2024.
//

import Foundation

class CharacterTarget: TargetProtocol {
	var path: String
	var page: Int?
	
	init(endPoint: CharacterTarget.Endpoints, page: Int? = nil) {
		self.path = endPoint.path
		self.page = page
	}
	
	enum Endpoints {
		case allCharacters
		case singleCharacter(id: String)
		
		var path: String {
			switch self {
			case .allCharacters:
				"/api/character"
			case .singleCharacter(let id):
				"/api/character/\(id)"
			}
		}
	}
	
	var queryParams: [String: String?]? {
		if let page {
			return ["page": String(page)]
		}
		return nil
	}
}
