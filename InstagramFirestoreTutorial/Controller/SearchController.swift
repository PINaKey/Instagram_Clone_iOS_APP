//
//  SearchController.swift
//  InstagramFirestoreTutorial
//
//  Created by Pinaki Bandyopadhyay on 05/02/1401 AP.
//  Copyright © 1401 AP Pinaki Bandyopadhyay. All rights reserved.
//

import UIKit

private let reusableIdentifier = "UserCell"

class SearchController: UITableViewController {
    
    //MARK: - Properties
    
    private var users = [User]()
    private var filteredUsers = [User]()
    private let searchController = UISearchController(searchResultsController: nil)
    
    private var inSearchMode: Bool {
        return searchController.isActive && !searchController.searchBar.text!.isEmpty
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchController()
        configureTableView()
        fetchUsers()
    }
    
    //MARK: - API
    func fetchUsers(){
        UserService.fetchUsers { users in
            self.users = users
            self.tableView.reloadData()
        }
    }
    
    
    //MARK: - Helpers
    
    func configureTableView(){
        view.backgroundColor = .white
    
        tableView.register(UserCell.self, forCellReuseIdentifier: reusableIdentifier)
        tableView.rowHeight = 64
    }
    
    func configureSearchController(){
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = false
    }
}

//MARK: - UITableViewDataSource

extension SearchController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inSearchMode ? filteredUsers.count : users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableIdentifier, for: indexPath) as! UserCell
        
        let user = inSearchMode ? filteredUsers[indexPath.row] : users[indexPath.row]
        cell.viewModel = UserCellViewModel(user: user)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = inSearchMode ? filteredUsers[indexPath.row] : users[indexPath.row]
        let controller = ProfileController(user: user)
        navigationController?.pushViewController(controller, animated: true)
    }
}

//MARK: - UISearchResultUpdating

extension SearchController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        filteredUsers = users.filter({ $0.userName.contains(searchText) || $0.fullName.contains(searchText) })
        
        self.tableView.reloadData()
    }
}
