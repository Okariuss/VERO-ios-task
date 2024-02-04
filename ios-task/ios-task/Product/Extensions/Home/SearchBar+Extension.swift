//
//  SearchBar+Extension.swift
//  ios-task
//
//  Created by Okan Orkun on 3.02.2024.
//

import Foundation
import UIKit

extension HomeScreenViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        handleSearch(with: searchBar.text)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        handleSearch(with: "")
        searchBar.text = ""
        searchBar.resignFirstResponder()
        search(shouldShow: false)
    }
    
    private func handleSearch(with searchText: String?) {
        viewModel.updateSearchText(searchText ?? "")
        tableView.reloadData()
        
        if searchText?.isEmpty == true {
            viewModel.loginAndFetchData()
        }
    }
}
