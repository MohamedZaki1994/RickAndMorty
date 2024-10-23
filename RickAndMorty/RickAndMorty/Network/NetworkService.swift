//
//  NetworkService.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 22/10/2024.
//

import Foundation
class NetworkService: NetworkServiceProtocol {
	func request<T: Decodable>(target: TargetProtocol) async throws -> T {
		let urlRequest = try requestBuilder(target: target)
		do {
			let (data, response) = try await URLSession.shared.data(for: urlRequest)
			guard let response = response as? HTTPURLResponse else { throw NetworkError.invalidURL }
			guard 200...299 ~= response.statusCode else {
				if 500...599 ~= response.statusCode { throw NetworkError.internalServerError }
				if 400...499 ~= response.statusCode { throw NetworkError.badRequest }
				throw NetworkError.unknown
			}
			do {
				return try JSONDecoder().decode(T.self, from: data)
			} catch {
				throw NetworkError.decode
			}
		} catch {
			throw NetworkError.unknown
		}
	}
}
