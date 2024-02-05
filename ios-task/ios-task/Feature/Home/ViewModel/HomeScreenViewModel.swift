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

    private var tasks: Task = []
    private var searchText: String = ""
    
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


    private func parseTasks(from data: Data) -> Task {
        do {
            let decoder = JSONDecoder()
            let decodedTasks = try decoder.decode(Task.self, from: data)
            return decodedTasks
        } catch {
            print("Error parsing tasks response: \(error)")
            return []
        }
    }

    var numberOfTasks: Int {
        return filteredTasks().count
    }

    func task(at index: Int) -> TaskModel {
        return filteredTasks()[index]
    }

    func updateSearchText(_ newText: String) {
        searchText = newText
        delegate?.didUpdateTasks()
    }
    
    var sortedAndGroupedTasks: [String: Task] {
        let sortedTasks = filteredTasks().sorted { $0.task < $1.task }
        var groupedTasks = [String: Task]()

        for task in sortedTasks {
            let key: String

            if !task.parentTaskID.rawValue.isEmpty {
                key = task.parentTaskID.rawValue
            } else {
                key = task.task
            }

            if var existingTasks = groupedTasks[key] {
                existingTasks.append(task)
                groupedTasks[key] = existingTasks
            } else {
                groupedTasks[key] = [task]
            }
        }

        return groupedTasks
    }

    private func filteredTasks() -> Task {
        return searchText.isEmpty ? tasks : tasks.filter { task in
            let search = searchText.lowercased()

            let hasMatchingDescription = task.description.lowercased().contains(search)
            let hasMatchingColorCode = task.colorCode.lowercased().contains(search)
            let hasMatchingParentTaskID = task.parentTaskID.rawValue.lowercased().contains(search)
            let hasMatchingWageType = task.wageType.lowercased().contains(search)
            let hasMatchingTitle = task.title.lowercased().contains(search)
            let hasMatchingBusinessUnit = task.businessUnit.rawValue.lowercased().contains(search)
            let hasMatchingBusinessUnitKey = task.businessUnitKey?.rawValue.lowercased().contains(search) ?? false
            let hasMatchingSort = task.sort.lowercased().contains(search)
            let hasMatchingTask = task.task.lowercased().contains(search)
            let hasMatchingWorkingTime = task.workingTime.debugDescription.lowercased().contains(search)
            let hasMatchingPreplanningBoardQuickSelect = task.preplanningBoardQuickSelect.debugDescription.lowercased().contains(search)
            let hasMatchingIsAvailable = task.isAvailableInTimeTrackingKioskMode.description.lowercased().contains(search)
            return hasMatchingDescription ||
                   hasMatchingColorCode ||
                   hasMatchingParentTaskID ||
                   hasMatchingWageType ||
                   hasMatchingTitle ||
                   hasMatchingBusinessUnit ||
                   hasMatchingBusinessUnitKey ||
                   hasMatchingSort ||
                   hasMatchingTask ||
                   hasMatchingWorkingTime ||
                   hasMatchingPreplanningBoardQuickSelect ||
                   hasMatchingIsAvailable
        }
    }
}
