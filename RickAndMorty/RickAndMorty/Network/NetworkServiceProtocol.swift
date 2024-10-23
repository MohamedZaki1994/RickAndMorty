//
//  NetworkServiceProtocol.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 22/10/2024.
//

import Foundation

protocol NetworkServiceProtocol {
	func request<T: Decodable>(target: TargetProtocol) async throws -> T
}

extension NetworkServiceProtocol {
	func requestBuilder(target: TargetProtocol) throws -> URLRequest {
		var urlComponent = URLComponents()
		urlComponent.scheme = target.scheme
		urlComponent.host = target.host
		urlComponent.queryItems = target.queryParams?.map { URLQueryItem(name: $0.key, value: $0.value) }
		urlComponent.path = target.path
		
		guard let url = urlComponent.url else { throw NetworkError.invalidURL }
		var request = URLRequest(url: url)
		request.httpMethod = target.method.rawValue
		request.allHTTPHeaderFields = target.header
		if let body = target.body {
			request.httpBody = try JSONEncoder().encode(body)
		}
		return request
	}
}
