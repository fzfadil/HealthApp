//
//  SignViewController.swift
//  AllergyDetector
//
//  Created by Fatma Zehra Fadıl on 9.09.2024.
//

import UIKit

class SignViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let signVM = SignViewModel()
    
    private var name : String?
    private var password : String?
    var personalId : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { // return e bastıysa
        
        if textField.tag == 0 {
            nameTextField.endEditing(true)
            passwordTextField.becomeFirstResponder()
        } else if textField.tag == 1 {
            passwordTextField.endEditing(true)
            passwordTextField.resignFirstResponder()
        }
       
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.tag == 0 {
            name = textField.text
        } else if textField.tag == 1 {
            password = textField.text
        }
    
        if name != nil && password != nil {
            personalId = signVM.controlSignOperation(name: name!, password: password!)
           
        }
       
    }
    
    @IBAction func showNextPage(_ sender: UIButton) {
        
        guard let username = nameTextField.text, !username.isEmpty,
        let password = passwordTextField.text, !password.isEmpty else {
            showAlert()
            return
        }
        
        if personalId != 0 && personalId != nil{
            
            performSegue(withIdentifier: "signSegue", sender: self)
            
        }
    }
    
    func showAlert() {
       
        let alertController = UIAlertController(title: "", message: "Kullanıcı adı veya şifreniz yanlış", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
        alertController.addAction(okAction)

        self.present(alertController, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "signSegue" {
            
            let vc = segue.destination as! PatientProfileViewController
            vc.personalId = personalId
        }
       
    }


}
