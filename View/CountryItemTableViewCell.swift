//
//  CountryItemTableViewCell.swift
//  CountrySearch
//
//  Created by Kaden Storrs on 11/12/19.
//  Copyright © 2019 Kaden Storrs. All rights reserved.
//

import UIKit

class CountryItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var label4: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
