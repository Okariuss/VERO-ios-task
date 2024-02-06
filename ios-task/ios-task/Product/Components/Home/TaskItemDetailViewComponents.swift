//
//  TaskItemDetailViewComponents.swift
//  ios-task
//
//  Created by Okan Orkun on 4.02.2024.
//

import Foundation
import UIKit

class TaskItemDetailViewComponents {
    
    static func defaultLabelComponent(_ text: String?) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = text
        label.font = Theme.defaultTheme.themeFont.bodyFont.boldVersion
        label.textAlignment = .left
        return label
    }
}
