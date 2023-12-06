//
//  APIEndpoints.swift
//  Yummi
//
//  Created by Omar Abdulrahman on 05/12/2023.
//

import Foundation

enum BuildSettingsKey: String {
    
    case BASE_URL
    case AUTH_URL
    case SIGNAL_LINE_SERVER
    
    var value: String {
        get {
            return Bundle.main.infoDictionary![self.rawValue] as! String
        }
    }
}

enum APIEndPoints {
    case allCategories
}

protocol EndPoint {
    var base: String { get }
    var path: String { get }
}

extension APIEndPoints: EndPoint {
    var base: String {
        return BuildSettingsKey.BASE_URL.value
    }
    
    var path: String {
        switch self {
        case .allCategories:
            return "dish-categories"
            
        }
    }
}
