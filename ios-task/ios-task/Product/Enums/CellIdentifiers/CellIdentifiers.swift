//
//  CellIdentifiers.swift
//  ios-task
//
//  Created by Okan Orkun on 2.02.2024.
//

import Foundation

enum CellIdentifiers {
    case taskItemView
    
    var rawValue: String {
        switch self {
        case .taskItemView:
            return "TaskCell"
        }
    }
}
