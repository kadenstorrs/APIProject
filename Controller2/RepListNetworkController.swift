//
//  RepItem.swift
//  CountrySearch
//
//  Created by Kaden Storrs on 11/14/19.
//  Copyright © 2019 Kaden Storrs. All rights reserved.
//

import Foundation

class RepListNetworkController: RepListController {
    let baseURL = URL(string: "https://whoismyrepresentative.com/getall_mems.php?output=jsonzip=")!
    let session = URLSession.shared
    let path = "rep"
    
    
    func getRepList(completion: @escaping
    (Result<RepList, RepListError>) -> Void) {
        let repListURL = baseURL.appendingPathComponent(path)
        let request = URLRequest(url: repListURL)
        
        let task = session.dataTask(with: request) {
            (data, response, error) in
            guard error == nil else { return
                completion(.failure(.failed)) }
            if (response as? HTTPURLResponse)?.statusCode == 200, let data = data {
                let decoder = JSONDecoder()
                
                do {
                    let repList = try
                        decoder.decode(RepList.self, from: data)
                    completion(.success(repList))
                } catch {
                    print(error)
                    completion(.failure(.failed))
                }
            } else {
                completion(.failure(.failed))
            }
        }
        task.resume()
    }
}

