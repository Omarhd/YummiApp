//
//  DataModel.swift
//  Yummi
//
//  Created by Omar Abdulrahman on 05/12/2023.
//

import Foundation

// MARK: - APIResponse
struct APIResponse: Codable {
    let status: Int
    let message: String
    let data: FullData
}

// MARK: - DataClass
struct FullData: Codable {
    let categories: [Category]
    let populars, specials: [Popular]
}

// MARK: - Category
struct Category: Codable, Identifiable {
    let id, title: String
    let image: String
}

// MARK: - Popular
struct Popular: Codable, Identifiable {
    let id, name, description: String
    let image: String
    let calories: Int
}
