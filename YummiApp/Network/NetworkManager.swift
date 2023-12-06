//
//  NetworkManager.swift
//  Yummi
//
//  Created by Omar Abdulrahman on 05/12/2023.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case requestFailed(statusCode: Int, data: Data?)
    // Add more error cases as needed
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    // Add more HTTP methods as needed
}

struct APIRequest<T: Decodable> {
    let endpoint: String
    let method: HTTPMethod
    let parameters: [String: Any]?
    
    init(endpoint: String, method: HTTPMethod = .get, parameters: [String: Any]? = nil) {
        self.endpoint = endpoint
        self.method = method
        self.parameters = parameters
    }
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let baseURL: String
    
    private init() {
        #if DEBUG
        baseURL = BuildSettingsKey.BASE_URL.value
        #else
        // Add configurations for other environments as needed
        baseURL = BuildSettingsKey.BASE_URL.value
        #endif
    }
    
    //MARK: - async Throws way
    
    func requestAsync<T: Decodable>(path: String, method: HTTPMethod, body: Data? = nil) async throws -> T {
        guard let url = URL(string: baseURL + path) else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(from: request.url!)
        
        print("response \(response)")
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }

        do {
            let decodedObject = try JSONDecoder().decode(T.self, from: data)
            return decodedObject
        } catch {
            throw NetworkError.invalidData
        }
    }
}
