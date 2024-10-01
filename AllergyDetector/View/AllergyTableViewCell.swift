//
//  AllergyTableViewCell.swift
//  AllergyDetector
//
//  Created by Fatma Zehra Fadıl on 1.10.2024.
//

import UIKit

class AllergyTableViewCell: UITableViewCell {

    @IBOutlet weak var allergyNameLbl: UILabel!
    @IBOutlet weak var allergyInfoLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
