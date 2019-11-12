//
//  CountryItemController.swift
//  CountrySearch
//
//  Created by Kaden Storrs on 11/11/19.
//  Copyright © 2019 Kaden Storrs. All rights reserved.
//

import Foundation
import UIKit

class CountryItemController {
    
    
    
    func fetchItems(matching query: [String: String], completion: @escaping ([CountryItem]?) -> Void) {
        let baseURL = URL(string: "https://api.worldbank.org/country/?format=json")
        
        guard let url = baseURL?.withQueries(query) else {
            completion(nil)
            print("Nope!")
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if let data = data, let string = String(data: data, encoding: .utf8) {
                
                print(string)
                
            }
            
            let decoder = JSONDecoder()
            if let data = data, let countryItems = try? decoder.decode(CountryItems.self, from: data) {
                completion(countryItems.results)
            } else {
                print("Sucks to suck")
                
                completion(nil)
                return
                
            }
            
        }
        task.resume()
    }
    
}
