//
//  Patient.swift
//  AllergyDetector
//
//  Created by Fatma Zehra Fadıl on 6.09.2024.
//

import Foundation

class Patient {

    static let sharedPatient = Patient()
    
    var personalId : Int?
    var name : String?
    var surname : String?
    var age : Int?
    var gender : String?
    var allergyInfo : [String]?
    var password : Int?
    var height : Int?
    var weight : Int?
    var blood : String?
    
    
    func setValues(name: String? = nil, surname: String? = nil, age: Int? = nil, gender: String? = nil, allergyInfo: [String]? = nil, password : Int? = nil, personalId : Int? = nil, height : Int? = nil, weight : Int? = nil, blood : String? = nil) {
    
        self.name = name
        self.surname = surname
        self.age = age
        self.gender = gender
        self.allergyInfo = allergyInfo
        self.password = password
        self.personalId = personalId
        self.height = height
        self.weight = weight
        self.blood = blood
    }
    
    private init(personalId : Int? = nil) {
        
        self.personalId = personalId
    }

}


