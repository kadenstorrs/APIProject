//
//  URL&Helpers.swift
//  CountrySearch
//
//  Created by Kaden Storrs on 11/14/19.
//  Copyright © 2019 Kaden Storrs. All rights reserved.
//

import Foundation

struct RepList: Codable {
    let count: Int
    let results: [RepListItem]
}
struct RepListItem: Codable {
    let zipCode: String
    let url: URL
}
