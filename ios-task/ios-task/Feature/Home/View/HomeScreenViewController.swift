//
//  HomeScreenViewController.swift
//  ios-task
//
//  Created by Okan Orkun on 1.02.2024.
//

import UIKit

class HomeScreenViewController: UIViewController {

    var viewModel: HomeScreenViewModel!
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "VERO iOS Task"
        label.font = Theme.defaultTheme.themeFont.headlineFont
        label.textColor = .label
        return label
    }()
    
    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        return searchController
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var accessibleTableView: UITableView {
        return tableView
    }
    
    private func configureNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDesign()
        
    }
    
    private func setDesign() {
        
        configureNavigationBar()
        
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
