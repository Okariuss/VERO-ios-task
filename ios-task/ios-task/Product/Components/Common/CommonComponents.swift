//
//  CommonComponents.swift
//  ios-task
//
//  Created by Okan Orkun on 6.02.2024.
//

import Foundation
import UIKit

class CommonComponents {
    
    static func commonAlert(_ message: String) -> UIAlertController {
        let alert = UIAlertController(title: AppConstants.error, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: AppConstants.ok, style: .default, handler: nil)
        alert.addAction(okAction)
        return alert
    }
}
