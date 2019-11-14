//
//  ExampleTableView.swift
//  CountrySearch
//
//  Created by Kaden Storrs on 11/14/19.
//  Copyright © 2019 Kaden Storrs. All rights reserved.
//

import Foundation





//import UIKit
//
//class StateTableViewController: UITableViewController,UISearchResultsUpdating {
//    let stateListController: StateListController = StateListNetworkController()
//    var stateList: StateResult = StateResult(stateInfo: []) {
//        didSet {
//            filteredStates = stateList.stateInfo
//        }
//    }
//    let searchController = UISearchController(searchResultsController: nil)
//    var filteredStates: [StateInfo] = []
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        searchController.searchResultsUpdater = self
//        searchController.hidesNavigationBarDuringPresentation = false
//        searchController.dimsBackgroundDuringPresentation = false
//        searchController.searchBar.sizeToFit()
//        self.tableView.tableHeaderView = searchController.searchBar
//        stateListController.getStateResult { result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let stateList):
//                    self.stateList = stateList
//                    self.tableView.reloadData()
//                case .failure:
//                    let alert = UIAlertController(title: "Error", message: "Failed to load data", preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                    self.present(alert, animated: true, completion: nil)
//                }
//            }
//        }
//    }
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return filteredStates.count
//    }
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let state = filteredStates[indexPath.row]
//        let cell = tableView.dequeueReusableCell(withIdentifier: "StateCell", for: indexPath)
//        cell.textLabel?.text = state.state
//        cell.detailTextLabel?.text = String(state.population)
//        return cell
//    }
//    func updateSearchResults(for searchController: UISearchController) {
//        guard let searchString = searchController.searchBar.text, !searchString.isEmpty else {
//            filteredStates = stateList.stateInfo
//            tableView.reloadData()
//            return
//        }
//        filteredStates = stateList.stateInfo.filter { $0.state.lowercased().contains(searchString.lowercased()) }
//        tableView.reloadData()
//    }
//}
