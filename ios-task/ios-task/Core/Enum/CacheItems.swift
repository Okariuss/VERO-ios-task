//
//  CacheItems.swift
//  ios-task
//
//  Created by Okan Orkun on 5.02.2024.
//

import Foundation

enum CacheItems {
    case token
    case savedTasks
    
    var key: String {
        switch self {
        case .token:
            return "token"
        case .savedTasks:
            return "savedTasks"
        }
    }
    
    var readString: String? {
        return UserDefaults.standard.string(forKey: key)
    }
    
    func writeString(_ string: String?) {
        UserDefaults.standard.set(string, forKey: key)
    }
    
    var readData: Data? {
        return UserDefaults.standard.data(forKey: key)
    }
    
    func writeData(_ data: Data?) {
        UserDefaults.standard.set(data, forKey: key)
    }
}
