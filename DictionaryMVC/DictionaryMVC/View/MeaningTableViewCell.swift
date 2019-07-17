//
//  MeaningTableViewCell.swift
//  DictionaryMVC
//
//  Created by Shubhang Dixit on 22/01/18.
//  Copyright © 2018 Shubhang Dixit. All rights reserved.
//

import UIKit

class MeaningTableViewCell: UITableViewCell {

    @IBOutlet weak var exampleLabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
