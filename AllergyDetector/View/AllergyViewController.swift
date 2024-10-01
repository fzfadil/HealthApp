//
//  AllergyViewController.swift
//  AllergyDetector
//
//  Created by Fatma Zehra Fadıl on 30.09.2024.
//

import UIKit

class AllergyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
   
    let allergyVM = AllergyViewModel()
    let allergies = Allergy.subclasses
    
    @IBOutlet weak var allergyTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        allergyTableView.dataSource = self
        allergyTableView.delegate = self
        
        allergyTableView.register(UINib(nibName: "AllergyTableViewCell", bundle: nil), forCellReuseIdentifier: "AllergyTableViewCell")
        
    }
    
    @IBAction func dismissButtonSelected(_ sender: UIButton) {
        
        self.dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      
        let headerView = Bundle.main.loadNibNamed("AllergyTableViewCell", owner: self, options: nil)?.first as? AllergyTableViewCell
      
        headerView?.allergyNameLbl.font = UIFont.boldSystemFont(ofSize: 17)
        headerView?.allergyInfoLbl.font = UIFont.boldSystemFont(ofSize: 17)
        headerView?.allergyNameLbl.text = "ALERJİLER"
        headerView?.allergyInfoLbl.text = "DURUM"
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allergies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllergyTableViewCell", for: indexPath) as! AllergyTableViewCell
        
        let currentAllergy = allergies[indexPath.row].init()
        cell.allergyNameLbl.text = currentAllergy.name
        if currentAllergy.controlAllergy() != "" {
            cell.allergyInfoLbl.text = "+"
        } else {
            cell.allergyInfoLbl.text = "-"
        }
        
        
        return cell
    }
    

}
