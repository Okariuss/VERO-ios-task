//
//  CacheItems.swift
//  ios-task
//
//  Created by Okan Orkun on 5.02.2024.
//

import Foundation

enum CacheItems {
    case token
    case tokenExpiration
    case savedTasks
    
    var key: String {
        switch self {
        case .token:
            return "token"
        case .tokenExpiration:
            return "tokenExpiration"
        case .savedTasks:
            return "savedTasks"
        }
    }
}

struct CacheItem<T> {
    let cacheItem: CacheItems
    
    func writeData(_ data: T) {
        UserDefaults.standard.set(data, forKey: cacheItem.key)
    }
    
    var readData: T? {
        return UserDefaults.standard.value(forKey: cacheItem.key) as? T
    }
}
