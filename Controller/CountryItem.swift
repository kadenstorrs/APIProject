//
//  CountryItem.swift
//  CountrySearch
//
//  Created by Kaden Storrs on 11/11/19.
//  Copyright © 2019 Kaden Storrs. All rights reserved.
//

import Foundation


struct CountryItem: Codable {
    var id: String
    var iso2Code: String
    var name: String
    var region: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case iso2Code = "iso2Code"
        case name = "name"
        case region = "region"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try values.decode(String.self, forKey: .id)
        self.iso2Code = try values.decode(String.self, forKey: .iso2Code)
        self.name = try values.decode(String.self, forKey: .name)
        self.region = try values.decode(String.self, forKey: .region)
    }
}
struct CountryItems: Codable {
    let results: [CountryItem]
    
}
