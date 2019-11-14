//
//  CountryItem.swift
//  CountrySearch
//
//  Created by Kaden Storrs on 11/11/19.
//  Copyright © 2019 Kaden Storrs. All rights reserved.
//

import Foundation


struct CountryItem: Codable {
    
    var nation: String
    var population: Int
    var year: String

    
        enum CodingKeys: String, CodingKey {
            case population = "Population"
            case year = "Year"
            case nation = "Nation"
        }
}
    
//    var idNation: String
//    var nation: String
//    var year: String
//    var population: String
    

    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//
//        self.drilldown = try values.decode(String.self, forKey: .drilldown)
//        self.measure = try values.decode(String.self, forKey: .measure)
//        self.year = try values.decode(String.self, forKey: .year)
    
//        self.idNation = try values.decode(String.self, forKey: .idNation)
//        self.nation = try values.decode(String.self, forKey: .nation)
//        self.year = try values.decode(String.self, forKey: .year)
//        self.population = try values.decode(String.self, forKey: .population)
    
//}

struct CountryItems: Codable {
    
    var data: [CountryItem]
    
}
