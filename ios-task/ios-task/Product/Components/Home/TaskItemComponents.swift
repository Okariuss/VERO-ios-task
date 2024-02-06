//
//  TaskItemComponents.swift
//  ios-task
//
//  Created by Okan Orkun on 6.02.2024.
//

import Foundation
import UIKit

class TaskItemComponents {
    
    static func defaultLabelComponent(_ font: UIFont) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = font
        return label
    }
}
