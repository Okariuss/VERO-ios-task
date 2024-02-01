//
//  UIFont+Extension.swift
//  ios-task
//
//  Created by Okan Orkun on 2.02.2024.
//

import Foundation
import UIKit

extension UIFont {
    var boldVersion: UIFont {
        guard let descriptor = fontDescriptor.withSymbolicTraits(.traitBold) else {
            return self
        }

        return UIFont(descriptor: descriptor, size: .zero)
    }
}
