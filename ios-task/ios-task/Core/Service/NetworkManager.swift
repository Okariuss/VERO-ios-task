//
//  NetworkManager.swift
//  ios-task
//
//  Created by Okan Orkun on 1.02.2024.
//

import Foundation
import SystemConfiguration.CaptiveNetwork

class NetworkManager {
    
    static let shared = NetworkManager()

    private init() {}
    
    var isConnected: Bool {
        return isConnectedToWiFi()
    }
    
    func request(endpoint: Endpoint, completion: @escaping (Data?, Error?) -> Void) {
        let request = endpoint.request()

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            completion(data, error)
        }

        dataTask.resume()
    }
    
    private func isConnectedToWiFi() -> Bool {
        if let interfaces = CNCopySupportedInterfaces() as NSArray? {
            for interface in interfaces {
                if let interfaceInfo = CNCopyCurrentNetworkInfo(interface as! CFString) as NSDictionary? {
                    if let ssid = interfaceInfo[kCNNetworkInfoKeySSID as String] as? String, !ssid.isEmpty {
                        return true
                    }
                }
            }
        }
        return false
    }
}
