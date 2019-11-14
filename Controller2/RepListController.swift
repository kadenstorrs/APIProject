//
//  RepController.swift
//  CountrySearch
//
//  Created by Kaden Storrs on 11/14/19.
//  Copyright © 2019 Kaden Storrs. All rights reserved.
//

import Foundation


enum RepListError: Error {
    case failed
}

protocol RepListController {
    func getRepList(completion: @escaping
        (Result<RepList, RepListError>) -> Void)
}
