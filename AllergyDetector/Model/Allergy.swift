//
//  Allergy.swift
//  AllergyDetector
//
//  Created by Fatma Zehra Fadıl on 6.09.2024.
//

import Foundation


class Allergy {
    
    var name : String?
    var precaution : String?
    
    func controlAllergy() -> String {
        
        let isAllergic = Bool.random()   // Buraya gerçek hayatta test yapıldıktan sonra doktorun gireceği sonuç eklenecektir.
        if isAllergic == true {
            return name!
        } else {
            return ""
        }
    }
    
}

class Pollen : Allergy {
    
    override init() {
        super.init()
        self.name = "Pollen"
        self.precaution = ""
    }
    
}

class DustMite : Allergy {
    
    override init() {
        super.init()
        self.name = "DustMite"
        self.precaution = ""
    }
}

class Food : Allergy {
    
    override init() {
        super.init()
        self.name = "Food"
        self.precaution = ""
    }
}

class Pet : Allergy {
    
    override init() {
        super.init()
        self.name = "Pet"
        self.precaution = ""
    }
}

class Mold : Allergy {
    
    override init() {
        super.init()
        self.name = "Mold"
        self.precaution = ""
    }
}

class Drug : Allergy {
 
    override init() {
        super.init()
        self.name = "Drug"
        self.precaution = ""
    }
}

class InsectSting : Allergy {
    
    override init() {
        super.init()
        self.name = "InsectSting"
        self.precaution = ""
    }
}

class Latex : Allergy {
    
    override init() {
        super.init()
        self.name = "Latex"
        self.precaution = ""
    }
}
