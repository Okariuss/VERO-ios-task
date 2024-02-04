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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfTasks
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.taskItemView.rawValue, for: indexPath) as? TaskItemView else {
            fatalError("Failed to dequeue TaskItemViewCell.")
        }

        let task = viewModel.task(at: indexPath.row)
        cell.configure(with: task)

        return cell
    }

}
