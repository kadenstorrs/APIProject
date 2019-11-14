//
//  RepTableViewController.swift
//  CountrySearch
//
//  Created by Kaden Storrs on 11/14/19.
//  Copyright © 2019 Kaden Storrs. All rights reserved.
//

import UIKit

class RepTableViewController: UITableViewController {
    
    @IBOutlet weak var repSearchBar: UISearchBar!
    
    var repList: RepList = RepList(count: 0, results: [])

    let repListController: RepListController = RepListNetworkController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        repListController.getRepList { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let repList):
                    print(repList)
                    self.repList = repList
                    self.tableView.reloadData()
                    
                case .failure:
                    let alert = UIAlertController(title: "OOF!!", message: "Sucks to suck", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                }
            }
            
        }
      
    }

    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return repList.results.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepCell", for: indexPath)
        
        cell.textLabel?.text = repList.results[indexPath.row].zipCode
        
        return cell
    }

    

}

//extension RepresentativeTableViewController: UISearchBarDelegate {
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        let zipCode = searchBar.text
//        if let unwrappedZipCode = zipCode {
//            let newBaseURL = ("\(RepListController.baseURL)\(unwrappedZipCode)")
//            print("Received New URL \(newBaseURL)")
//        }
//    }
//}
