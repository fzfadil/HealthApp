//
//  ViewController.swift
//  AllergyDetector
//
//  Created by Fatma Zehra Fadıl on 6.09.2024.
//

import UIKit

class PatientProfileViewController: UIViewController {
    
    @IBOutlet weak var patientCollectionView: UICollectionView!
    @IBOutlet weak var patientProfileImg: UIImageView!
    @IBOutlet weak var patientName: UILabel!
    @IBOutlet weak var patientAge: UILabel!
    @IBOutlet weak var patientGender: UILabel!
    
    var patient : Patient?
    var personalId : Int?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        patient = Patient(personalId: personalId)
    }

    func preparePatientInfo() {
        
        if patient != nil {
            
            if patient!.gender == "man" {
                patientProfileImg.image = UIImage(named: "man")
            } else {
                patientProfileImg.image = UIImage(named: "woman")
            }
            
            patientName.text = (patient!.name ?? "") + " " + (patient!.surname ?? "")
            patientAge.text = String((patient!.age) ?? 0)
            patientGender.text = patient!.gender ?? "-"
        }
        
    }
    
    

}

