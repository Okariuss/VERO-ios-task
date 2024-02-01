//
//  AppConstants.swift
//  ios-task
//
//  Created by Okan Orkun on 2.02.2024.
//

import Foundation


final class NetworkConstants {
    private init() {}
    
    static let baseURL = "https://api.baubuddy.de/"
    static let loginURL = "index.php/login"
    static let getTasksURL = "dev/index.php/v1/tasks/select"
    
    static let authorizationKey = "Authorization"
    static let loginAuthorizationValue = "Basic QVBJX0V4cGxvcmVyOjEyMzQ1NmlzQUxhbWVQYXNz"
    static let contentTypeKey = "Content-Type"
    static let loginContentTypeValue = "application/json"
}
