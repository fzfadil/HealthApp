//
//  ViewController.swift
//  AllergyDetector
//
//  Created by Fatma Zehra Fadıl on 6.09.2024.
//

import UIKit

class PatientProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var patientCollectionView: UICollectionView!
    @IBOutlet weak var patientProfileImg: UIImageView!
    @IBOutlet weak var patientName: UILabel!
    @IBOutlet weak var patientAge: UILabel!
    @IBOutlet weak var patientHeight: UILabel!
    @IBOutlet weak var patientWeight: UILabel!
    @IBOutlet weak var patientBlood: UILabel!

    var patient = Patient.sharedPatient
    let patientProfileVM = PatientProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        patientCollectionView.delegate = self
        patientCollectionView.dataSource = self
        
        patientCollectionView.register(UINib(nibName: "PatientCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PatientCollectionViewCell")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        preparePatientInfo()
    }
    
    func preparePatientInfo() {
        
        if patient.gender == "man" {
            patientProfileImg.image = UIImage(named: "man")
        } else {
            patientProfileImg.image = UIImage(named: "woman")
        }
        
        patientName.text = (patient.name ?? "") + " " + (patient.surname ?? "")
        patientAge.text = String((patient.age) ?? 0) + " Yaş"
        patientHeight.text = String(patient.height ?? 0) + " Cm"
        patientWeight.text = String(patient.weight ?? 0) + " Kg"
        patientBlood.text = patient.blood
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PatientCollectionViewCell", for: indexPath) as! PatientCollectionViewCell
          
        switch indexPath.row {
        case 0:
            cell.backgroundColor = .brown
            cell.collectionViewLabel.text = "Alerjiler"
            break
        case 1:
            cell.backgroundColor = .orange
            cell.collectionViewLabel.text = "Reçeteler"
            break
        case 2:
            cell.backgroundColor = UIColor.init(red: 141.0/255.0, green: 238.0/255.0, blue: 238.0/255.0, alpha: 1.0)
            cell.collectionViewLabel.text = "Tahliller"
            break
        case 3:
            cell.backgroundColor = UIColor.init(red: 255.0/255.0, green: 228.0/255.0, blue: 181.0/255.0, alpha: 1.0)
            cell.collectionViewLabel.text = "İlaçlar"
            break
        default:
            break
        }
         
          
          return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: "allergy", sender: self)
            break
        case 1:
            //self.performSegue(withIdentifier: "signSegue", sender: self)
            break
        case 2:
           // self.performSegue(withIdentifier: "signSegue", sender: self)
            break
        case 3:
           // self.performSegue(withIdentifier: "signSegue", sender: self)
            break
        default:
            break
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            // Collection view'in genişliğini alın
            let padding: CGFloat = 10 // Aralıklara göre padding ayarı
            let collectionViewWidth = collectionView.frame.width
            
            // Her bir hücrenin genişliği, toplam genişliğin yarısı olacak (padding hesaba katılarak)
        let width = (collectionViewWidth - padding) / 2
            let height: CGFloat = width //kare olsun
            
            return CGSize(width: width, height: height)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "allergy":
            let vc = segue.destination as! AllergyViewController
        default:
            break
        }
       
       
    }
    
}

