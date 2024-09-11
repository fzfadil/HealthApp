//
//  Patient.swift
//  AllergyDetector
//
//  Created by Fatma Zehra Fadıl on 6.09.2024.
//

import Foundation

class Patient {
    
    var personalId : Int?
    var name : String?
    var surname : String?
    var age : Int?
    var gender : String?
    var allergyInfo : [Allergy]?
    
    
    init(name: String? = nil, surname: String? = nil, age: Int? = nil, gender: String? = nil, allergyInfo: [Allergy]? = nil) {
    
        self.name = name
        self.surname = surname
        self.age = age
        self.gender = gender
        self.allergyInfo = allergyInfo
    }
    
    init(personalId : Int? = nil) {
        
        self.personalId = personalId
    }

}


