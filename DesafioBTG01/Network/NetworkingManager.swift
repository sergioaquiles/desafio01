//
//  NetworkingManager.swift
//  DesafioBTG01
//
//  Created by Sergio Cardoso on 30/01/22.
// API_KEY: e5ffd2f8681389db48c56ac78adfb8c3


import Foundation
import Combine


class NetworkingManager {
	
	enum NetworkError: LocalizedError {
		case badURLResponse(url: URL)
		case unknown
		
		var errorDescription: String? {
			switch self {
			case .badURLResponse(url: let url):
				return "[🔥] Bad response from url\(url) "
			case .unknown:
				return "[⚠️] Unknown error ocurred"
			}
		}
	}
	
	static func download(url: URL) -> AnyPublisher<Data, Error> {
		return URLSession.shared.dataTaskPublisher(for: url)
			.tryMap({ try handleURLResponse(output: $0, url: url)})
			.eraseToAnyPublisher()
	}
	
	static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
		guard let response = output.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
			throw NetworkError.badURLResponse(url: url)
		}
		return output.data
	}
	
	static func handleCompletion(completion: Subscribers.Completion<Error>) {
		switch completion {
		case .finished:
			break
		case .failure(let error):
			print(error.localizedDescription)
		}
	}
}