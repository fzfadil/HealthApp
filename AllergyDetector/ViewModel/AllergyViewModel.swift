//
//  AllergyViewModel.swift
//  AllergyDetector
//
//  Created by Fatma Zehra Fadıl on 1.10.2024.
//

import Foundation

class AllergyViewModel {
    
    let allergies = Allergy.subclasses
    
    func getCurretnAllergyName(row : Int) -> String {
        return allergies[row].init().name ?? ""
    }
    
    func controlAllergy(row : Int) -> String {
        
        let allergy = allergies[row].init()
        
        if allergy.controlAllergy() != "" {
            return "+"
        } else {
            return "-"
        }
    }
    
}
