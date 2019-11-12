//
//  CountryListTableViewController.swift
//  CountrySearch
//
//  Created by Kaden Storrs on 11/11/19.
//  Copyright © 2019 Kaden Storrs. All rights reserved.
//

import UIKit

class CountryListTableViewController: UITableViewController {
    
    
    let countryItemController = CountryItemController()
    
    var items = [CountryItem]()
    
    @IBOutlet var searchBar: UISearchBar!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func fetchCountryItems() {
        self.items = []
        self.tableView.reloadData()
        
        let searchTerm = searchBar.text ?? ""
        
        
        if !searchTerm.isEmpty {
            let query: [String: String] = [
                "id": "",
                "iso2Code": "",
                "name": searchTerm
            ]
            countryItemController.fetchItems(matching: query)
            { (countryItems) in
                guard let countryItems = countryItems else { return }
                self.items = countryItems
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        }
    }
    
    
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        cell.textLabel?.text = item.name
        cell.textLabel?.text = item.iso2Code
        cell.textLabel?.text = item.region
        cell.textLabel?.text = item.id
        
    }
    
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        configure(cell: cell, forItemAt: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
extension CountryListTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        fetchCountryItems()
        
        searchBar.resignFirstResponder()
        
    }
    
}

