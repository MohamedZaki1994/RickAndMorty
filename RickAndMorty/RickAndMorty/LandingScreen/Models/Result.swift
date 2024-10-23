//
//  Result.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 22/10/2024.
//

struct Result: Codable {
    let id: Int
    let name: String
    let status: Status
    let species: Species
    let type: String
    let gender: Gender
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

enum Gender: String, Codable {
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

struct Location: Codable {
	let name: String
	let url: String
}

enum Species: String, Codable {
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

enum Status: String, Codable {
	case alive = "Alive"
	case dead = "Dead"
	case unknown = "unknown"
}
