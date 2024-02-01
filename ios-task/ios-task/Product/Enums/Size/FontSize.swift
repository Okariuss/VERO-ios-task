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
    
    var rawValue: CGFloat {
        switch self {
        case .body:
            return 12
        case .headline:
            return 18
        }
    }
    
    var toFont: UIFont {
        return .systemFont(ofSize: rawValue)
    }
}
