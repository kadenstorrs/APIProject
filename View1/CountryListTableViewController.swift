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
        searchBar.delegate = self
        searchBar.searchResultsUpdater = self
        searchBar.hidesNavigationBarDuringPresentation = false
        searchBar.dimsBackgroundDuringPresentation = false
    }
    
    func fetchCountryItems() {
        self.items = []
        self.tableView.reloadData()
        
        let searchTerm = searchBar.text ?? ""
        
        
        if !searchTerm.isEmpty {
            let query: [String: String] = [
                "drilldowns": "Nation",
               "measures": "Population",
                "Year": searchTerm
            ]
            countryItemController.fetchItems(matching: query, searchTerm: searchTerm)
            { (countryItems) in
                guard let countryItems = countryItems else { return }
                DispatchQueue.main.async {
                    self.items = countryItems
                    self.tableView.reloadData()
                    print(self.items)
                }
                
            }
        }
    }
    
    
    
   
    
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as? ThisOneTableViewCell else {
            return UITableViewCell()
        }
         let item = items[indexPath.row]
        cell.labelOne?.text = item.nation
        cell.labelTwo?.text = String(item.population)
        cell.labelFour?.text = item.year
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

