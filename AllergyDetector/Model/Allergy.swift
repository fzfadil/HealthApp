//
//  Allergy.swift
//  AllergyDetector
//
//  Created by Fatma Zehra Fadıl on 6.09.2024.
//

import Foundation


class Allergy {

    static let subclasses : [Allergy.Type] = [Pollen.self, DustMite.self, Food.self, Pet.self, Mold.self, Drug.self, InsectSting.self, Latex.self]
    
    var name : String?
    var precaution : String? // öneri
    
    required init(name: String? = nil, precaution: String? = nil) {
        self.name = name
        self.precaution = precaution
    }
    
    func controlAllergy() -> String {
        
        guard let allergies = Patient.sharedPatient.allergyInfo else {
            return ""
        }
        for allergy in allergies {
            if allergy == self.name {
                return name!
            }
        }
       
        return ""
    }

    
}

class Pollen : Allergy {
    
    required init(name: String? = nil, precaution: String? = nil) {
        super.init()
        self.name = "Pollen"
        self.precaution = ""
    }
    
}

class DustMite : Allergy {
    
    required init(name: String? = nil, precaution: String? = nil) {
        super.init()
        self.name = "DustMite"
        self.precaution = ""
    }
}

class Food : Allergy {
    
    required init(name: String? = nil, precaution: String? = nil) {
        super.init()
        self.name = "Food"
        self.precaution = ""
    }
}

class Pet : Allergy {
    
    required init(name: String? = nil, precaution: String? = nil) {
        super.init()
        self.name = "Pet"
        self.precaution = ""
    }
}

class Mold : Allergy {
    
    required init(name: String? = nil, precaution: String? = nil) {
        super.init()
        self.name = "Mold"
        self.precaution = ""
    }
}

class Drug : Allergy {
 
    required init(name: String? = nil, precaution: String? = nil) {
        super.init()
        self.name = "Drug"
        self.precaution = ""
    }
}

class InsectSting : Allergy {
    
    required init(name: String? = nil, precaution: String? = nil) {
        super.init()
        self.name = "InsectSting"
        self.precaution = ""
    }
}

class Latex : Allergy {
    
    required init(name: String? = nil, precaution: String? = nil) {
        super.init()
        self.name = "Latex"
        self.precaution = ""
    }
}
