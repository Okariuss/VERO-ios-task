//
//  NetworkManager.swift
//  ios-task
//
//  Created by Okan Orkun on 1.02.2024.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()

    private init() {}
    
    func request(endpoint: Endpoint, completion: @escaping (Data?, Error?) -> Void) {
        let request = endpoint.request()

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            completion(data, error)
        }

        dataTask.resume()
    }
}
