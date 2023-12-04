//
//  Item.swift
//  YummiApp
//
//  Created by Omar Abdulrahman on 04/12/2023.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
