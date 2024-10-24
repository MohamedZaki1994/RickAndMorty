//
//  MockDetailsNetworkService.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 24/10/2024.
//

import Foundation
@testable import RickAndMorty

class MockDetailsNetworkService: NetworkServiceProtocol {
	func request<T: Decodable>(target: TargetProtocol) async throws -> T {
		if let path = Bundle(for: type(of: self)).path(forResource: "MockCharacter", ofType: "json") {
			let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
			return try JSONDecoder().decode(T.self, from: data)
		} else {
			throw NetworkError.decode
		}
	}
}
