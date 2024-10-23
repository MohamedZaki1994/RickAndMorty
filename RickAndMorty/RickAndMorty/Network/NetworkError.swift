//
//  NetworkError.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 22/10/2024.
//

import Foundation

enum NetworkError: Error {
	case decode
	case invalidURL
	case noResponse
	case internalServerError
	case badRequest
	case unauthorized
	case unknown

	var customMessage: String {
		switch self {
		case .decode:
			return "Decode Error"
		case .invalidURL:
			return "Invalid URL Error"
		case .noResponse:
			return "No Response"
		case .unauthorized:
			return "Unauthorized URL"
		case .internalServerError:
			return "Server Error"
		case .badRequest:
			return "Bad Request"
		case .unknown:
			return "Unknown Error"
		}
	}
}
