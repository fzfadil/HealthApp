//
//  BrainModel.swift
//  AllergyDetector
//
//  Created by Fatma Zehra Fadıl on 9.09.2024.
//

import Foundation

protocol AllergyProtocol {
    
    func addAllergyInfo(allergy : Allergy, patient : Patient)
}


class Operation : AllergyProtocol {

    func addAllergyInfo(allergy : Allergy, patient : Patient) {
    
        if allergy.controlAllergy() != "" {
            patient.allergyInfo?.append(allergy)
        }
    }
    
   
    
}
