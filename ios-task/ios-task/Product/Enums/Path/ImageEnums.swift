//
//  ImageEnums.swift
//  ios-task
//
//  Created by Okan Orkun on 1.02.2024.
//

import Foundation
import UIKit

enum ImagePath {
    case appImage
    

    var rawValue: String {
        switch self {
        case .appImage:
            return "AppImage"
        }
        
    }
    
    
    var toImage: UIImage? {
        return UIImage(named: rawValue)
    }
}
