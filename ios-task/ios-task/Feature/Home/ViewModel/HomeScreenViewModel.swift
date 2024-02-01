//
//  HomeScreenViewModel.swift
//  ios-task
//
//  Created by Okan Orkun on 1.02.2024.
//

import Foundation

protocol HomeScreenViewModelDelegate: AnyObject {
    func didUpdateTasks()
}

class HomeScreenViewModel {

    weak var delegate: HomeScreenViewModelDelegate?

    private var tasks: [TaskModel] = []
    
    private var networkManager = NetworkManager.shared

    func loginAndFetchData() {
        let loginEndpoint = Endpoint.login

        networkManager.request(endpoint: loginEndpoint) { [weak self] data, error in
            guard let self = self else { return }

            if let error = error {
                print("Login Error: \(error)")
            } else if let data = data {
                    
                if let authToken = parseAuthToken(from: data) {
                    self.fetchData(authToken: authToken)
                }
            }
        }
    }

    private func fetchData(authToken: String) {
        let getTasksEndpoint = Endpoint.getTasks(token: authToken)

        networkManager.request(endpoint: getTasksEndpoint) { [weak self] data, error in
            guard let self = self else { return }

            if let error = error {
                print("Fetch Data Error: \(error)")
            } else if let data = data {
                let decodedTasks = parseTasks(from: data)

                self.tasks = decodedTasks

                DispatchQueue.main.async {
                    self.delegate?.didUpdateTasks()
                }
            }
        }
    }
    
    private func parseAuthToken(from data: Data) -> String? {
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
               let accessToken = json["oauth"] as? [String: Any],
               let tokenValue = accessToken["access_token"] as? String {
                return tokenValue
            } else {
                print("Error parsing access token from login response")
                return nil
            }
        } catch {
            print("Error parsing login response: \(error)")
            return nil
        }
    }


    private func parseTasks(from data: Data) -> [TaskModel] {
        do {
            let decoder = JSONDecoder()
            let decodedTasks = try decoder.decode([TaskModel].self, from: data)
            return decodedTasks
        } catch {
            print("Error parsing tasks response: \(error)")
            return []
        }
    }

    var numberOfTasks: Int {
        return tasks.count
    }

    func task(at index: Int) -> TaskModel {
        return tasks[index]
    }
}
