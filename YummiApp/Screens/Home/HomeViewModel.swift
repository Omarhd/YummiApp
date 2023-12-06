//
//  HomeViewModel.swift
//  Yummi
//
//  Created by Omar Abdulrahman on 05/12/2023.
//

import SwiftUI

final class AppetizerViewModel: ObservableObject {
    
    // MARK: - PROPERTIES
    @Published var categories: [Category] = []
    @Published var populars: [Popular] = []
    @Published var specials: [Popular] = []

    @Published var isLoading: Bool = true
    @Published var isShowingDetailsView: Bool = false

    // Assuming you have an asynchronous function that can call the request method
    func loads() {
        Task {
            do {
                let response: APIResponse = try await NetworkManager.shared.requestAsync(path: "dish-categories", method: .get)
                categories = response.data.categories
                populars = response.data.populars
                specials = response.data.specials
                
                print("specials \(specials)")
                
                isLoading = false
            } catch {
                // Handle the error
                isLoading = false
                if let appError = error as? NetworkError {
                    switch appError {
                    case .invalidURL:
                       
                        print("")
                    case .invalidResponse:
                        print("")

                    case .invalidData:
                        print("")

                    case .requestFailed(statusCode: let statusCode, data: let data):
                        print("\(statusCode), \(String(describing: data?.description))")

                    }
                }
            }
        }
    }
}
