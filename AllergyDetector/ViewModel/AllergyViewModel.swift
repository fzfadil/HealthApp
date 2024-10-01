//
//  AllergyViewModel.swift
//  AllergyDetector
//
//  Created by Fatma Zehra Fadıl on 1.10.2024.
//

import Foundation

class AllergyViewModel {
    
    func controlAllergy() {
        
        for subclass in Allergy.subclasses {
            let allergy = subclass.init()
            
            print(allergy.controlAllergy())
        }
    }
    
}
