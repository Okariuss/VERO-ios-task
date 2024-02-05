//
//  FontSize.swift
//  ios-task
//
//  Created by Okan Orkun on 2.02.2024.
//

import Foundation
import UIKit

enum FontSize {
    case body
    case headline
    case subtitle
    
    var rawValue: CGFloat {
        switch self {
        case .subtitle:
            return 12
        case .body:
            return 16
        case .headline:
            return 20
        }
    }
    
    var toFont: UIFont {
        return .systemFont(ofSize: rawValue)
    }
}
