//
//  TaskModel.swift
//  ios-task
//
//  Created by Okan Orkun on 1.02.2024.
//

import Foundation
import UIKit

struct TaskModel: Codable {
    let title: String
    let description: String
    let colorCode: String
    
    var backgroundColor: UIColor? {
        return UIColor(hexString: colorCode)
    }
}
