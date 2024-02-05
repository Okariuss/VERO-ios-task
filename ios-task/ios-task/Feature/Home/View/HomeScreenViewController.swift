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
        label.text = AppConstants.appName
        label.font = Theme.defaultTheme.themeFont.headlineFont
        label.textColor = .label
        return label
    }()
    
    private let searchBar = UISearchBar()
    
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private func configureNavigationBar() {
        showSearchBarButton(shouldShow: true)
        
        searchBar.sizeToFit()
        searchBar.delegate = self
    }
    
    func showSearchBarButton(shouldShow: Bool) {
        if shouldShow {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                                target: self,
                                                                action: #selector(searchButtonTapped))
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        } else {
            navigationItem.rightBarButtonItem = nil
            navigationItem.leftBarButtonItem = nil
        }
    }
    
    @objc private func searchButtonTapped() {
        searchBar.becomeFirstResponder()
        search(shouldShow: true)
    }
    
    @objc private func refreshData() {
        viewModel.authenticateAndFetchData()
    }
    
    func search(shouldShow: Bool) {
        showSearchBarButton(shouldShow: !shouldShow)
        searchBar.showsCancelButton = shouldShow
        navigationItem.titleView = shouldShow ? searchBar : nil
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
    
    private func refreshControl() -> UIRefreshControl {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        return refreshControl
    }
    
    private func tableViewDesign() {

        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TaskItemView.self, forCellReuseIdentifier: CellIdentifiers.taskItemView.rawValue)
        tableView.refreshControl = refreshControl()
    }
    
    private func viewModelOperation() {
        viewModel = HomeScreenViewModel()
        viewModel.delegate = self
        viewModel.authenticateAndFetchData()
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
