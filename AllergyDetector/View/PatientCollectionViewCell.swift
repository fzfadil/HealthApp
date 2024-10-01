//
//  PatientCollectionViewCell.swift
//  AllergyDetector
//
//  Created by Fatma Zehra Fadıl on 26.09.2024.
//

import UIKit

class PatientCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionViewLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.borderWidth = 1.0  
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 8.0
    }

}
