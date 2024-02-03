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
        if let searchText = searchBar.text {
            viewModel.updateSearchText(searchText)
            accessibleTableView.reloadData()
        } else {
            viewModel.loginAndFetchData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.updateSearchText("")
        accessibleTableView.reloadData()
    }
}
