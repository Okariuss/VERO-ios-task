//
//  SpaceSize.swift
//  ios-task
//
//  Created by Okan Orkun on 2.02.2024.
//

import Foundation

enum SpaceSize {
    case low
    case normal
    case medium
    case high
    
    var rawValue: CGFloat {
        switch self {
        case .low:
            return 4
        case .normal:
            return 8
        case .medium:
            return 12
        case .high:
            return 16
        }
        
    }
}
