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
    case search
    case qr
    

    var rawValue: String {
        switch self {
        case .appImage:
            return "AppImage"
        case .search:
            return "magnifyingglass"
        case .qr:
            return "qrcode.viewfinder"
        }
        
    }
    
    var toSystemImage: UIImage? {
        return UIImage(systemName: rawValue)
    }
    
    var toImage: UIImage? {
        return UIImage(named: rawValue)
    }
}
