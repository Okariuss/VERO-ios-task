//
//  HomeScreenViewController.swift
//  ios-task
//
//  Created by Okan Orkun on 1.02.2024.
//

import UIKit

class HomeScreenViewController: UIViewController {

    var viewModel: HomeScreenViewModel!
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDesign()
        
    }
    
    private func setDesign() {
        
        tableViewDesign()
        
        configureConstraints()
        
        viewModelOperation()
    }
    
    private func tableViewDesign() {

        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TaskItemView.self, forCellReuseIdentifier: CellIdentifiers.taskItemView.rawValue)
    }
    
    private func viewModelOperation() {
        viewModel = HomeScreenViewModel()
        viewModel.delegate = self
        viewModel.loginAndFetchData()
    }
    
    private func configureConstraints() {
        
        let tableViewConstraints = [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(tableViewConstraints)
    }
}

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
