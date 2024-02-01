//
//  Endpoint.swift
//  ios-task
//
//  Created by Okan Orkun on 1.02.2024.
//

import Foundation

protocol EndpointProtocol {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }

    func request() -> URLRequest
}

enum HTTPMethod: String {
    case get
    case post
    
    var rawValue: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        }
    }
}

enum Endpoint {
    case login
    case getTasks(token: String)
    
    private var parameters: [String: String]? {
        switch self {
        case .login:
            return [LoginConstants.username: LoginConstants.defaultUsername, LoginConstants.password: LoginConstants.defaultPassword]
        default:
            return nil
        }
    }
}

extension Endpoint: EndpointProtocol {

    var baseURL: String {
        return NetworkConstants.baseURL
    }

    var path: String {
        switch self {
        case .login:
            return NetworkConstants.loginURL
        case .getTasks:
            return NetworkConstants.getTasksURL
        }
    }

    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .getTasks:
            return .get
        }
    }

    var headers: [String: String] {
        switch self {
        case .login:
            return [
                NetworkConstants.authorizationKey: NetworkConstants.loginAuthorizationValue,
                NetworkConstants.contentTypeKey: NetworkConstants.loginContentTypeValue
            ]
        case let .getTasks(token):
            return [
                NetworkConstants.authorizationKey: "Bearer \(token)"
            ]
        }
    }

    func request() -> URLRequest {
        guard let url = URL(string: baseURL + path) else {
            fatalError("Invalid URL")
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers

        if let parameters = parameters {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        }

        return request
    }
}
