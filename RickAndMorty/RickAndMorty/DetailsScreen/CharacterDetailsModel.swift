//
//  CharacterDetailsModel.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 23/10/2024.
//

struct CharacterDetailsModel: Codable {
	let id: Int
	let status: String
	var image: String
	var name: String
	var gender: Gender
	var species: Species
	var location: Location
}
