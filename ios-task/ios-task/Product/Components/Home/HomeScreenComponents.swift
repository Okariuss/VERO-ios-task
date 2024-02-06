//
//  HomeScreenComponents.swift
//  ios-task
//
//  Created by Okan Orkun on 6.02.2024.
//

import Foundation
import UIKit

class HomeScreenComponents {
    
    static func defaultButtonComponent(_ image: UIImage?) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.tintColor = .label
        return button
    }
    
    static func defaultHomeViewLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = Theme.defaultTheme.themeFont.headlineFont
        label.textColor = .label
        return label
    }
}
