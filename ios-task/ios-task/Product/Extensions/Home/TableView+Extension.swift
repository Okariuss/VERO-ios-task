//
//  HomeScreenViewController+Extension.swift
//  ios-task
//
//  Created by Okan Orkun on 3.02.2024.
//

import Foundation
import UIKit

extension HomeScreenViewController: UITableViewDataSource, UITableViewDelegate, HomeScreenViewModelDelegate {
    
    func didUpdateTasks() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func endRefreshing() {
        DispatchQueue.main.async {
            self.tableView.refreshControl?.endRefreshing()
        }
    }
    
    func showError(message: String) {
        DispatchQueue.main.async {
            self.present(CommonComponents.commonAlert(message), animated: true, completion: nil)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sortedAndGroupedTasks.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let taskKey = Array(viewModel.sortedAndGroupedTasks.keys.sorted())[section]
        return viewModel.sortedAndGroupedTasks[taskKey]?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.taskItemView.rawValue, for: indexPath) as? TaskItemView else {
            fatalError("Failed to dequeue TaskItemViewCell.")
        }

        let taskName = viewModel.sortedAndGroupedTasks.keys.sorted()[indexPath.section]
        if let tasksForName = viewModel.sortedAndGroupedTasks[taskName] {
            let task = tasksForName[indexPath.row]
            cell.configure(with: task)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .lightGray
        
        let label = UILabel()
        label.text = "TASK: \(viewModel.sortedAndGroupedTasks.keys.sorted()[section])"
        label.font = Theme.defaultTheme.themeFont.headlineFont.boldVersion
        label.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let taskName = viewModel.sortedAndGroupedTasks.keys.sorted()[indexPath.section]
        if let tasksForName = viewModel.sortedAndGroupedTasks[taskName] {
            let selectedTask = tasksForName[indexPath.row]

            let taskDetailsVC = TaskDetailsViewController()
            taskDetailsVC.selectedTask = selectedTask

            navigationController?.pushViewController(taskDetailsVC, animated: true)
        }
    }
}
