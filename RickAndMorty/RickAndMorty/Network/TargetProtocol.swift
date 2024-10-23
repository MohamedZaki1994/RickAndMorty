//
//  TargetProtocol.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 22/10/2024.
//

import Foundation

protocol TargetProtocol {
	var scheme: String { get }
	var host: String { get }
	var path: String { get }
	var method: HTTPMethod { get }
	var header: [String: String]? { get }
	var body: [String: String?]? { get }
	var queryParams: [String: String?]? { get }
}

extension TargetProtocol {
	var scheme: String {
		"https"
	}
	
	var host: String {
		"rickandmortyapi.com"
	}
	
	var method: HTTPMethod {
		.get
	}
	
	var header: [String: String]? {
		nil
	}
	
	var body: [String: String?]? {
		nil
	}
	
	var queryParams: [String: String?]? {
		nil
	}
}
