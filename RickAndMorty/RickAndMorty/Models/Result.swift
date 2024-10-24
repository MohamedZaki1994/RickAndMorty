//
//  Result.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 22/10/2024.
//

struct Result: Codable, Equatable {
    let id: Int
    let name: String
    let status: Status
    let species: Species
    var type: String?
    let gender: Gender
	let location: Location
    let image: String
    var episode: [String]?
    var url: String?
    var created: String?
}

enum Gender: String, Codable, Equatable {
	case female = "Female"
	case male = "Male"
	case genderless = "Genderless"
	case unknown = "unknown"
	
	init(from decoder: any Decoder) throws {
		let container = try decoder.singleValueContainer()
		let value = try container.decode(String.self)
		self = Gender(rawValue: value) ?? .unknown
	}
}

struct Location: Codable, Equatable {
	let name: String
	let url: String
}

enum Species: String, Codable, Equatable {
	case alien = "Alien"
	case human = "Human"
	case humanoid = "Humanoid"
	case poopybutthole = "Poopybutthole"
	case mythological = "Mythological"
	case robot = "Robot"
	case unknown
	
	init(from decoder: any Decoder) throws {
		let container = try decoder.singleValueContainer()
		let value = try container.decode(String.self)
		self = Species(rawValue: value) ?? .unknown
	}
}

enum Status: String, Codable, CaseIterable {
	case alive = "Alive"
	case dead = "Dead"
	case unknown = "unknown"
	
	init(from decoder: any Decoder) throws {
		let container = try decoder.singleValueContainer()
		let value = try container.decode(String.self)
		self = Status(rawValue: value) ?? .unknown
	}
}
