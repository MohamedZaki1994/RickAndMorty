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
	var status: String?
	
	init(endPoint: CharacterTarget.Endpoints,
		 page: Int? = nil,
		 status: String? = nil) {
		self.path = endPoint.path
		self.page = page
		self.status = status
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
		var dic = [String: String?]()
		if let page {
			dic["page"] = String(page)
		}
		if let status {
			dic["status"] = status
		}
		return dic
	}
}
