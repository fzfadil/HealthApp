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
    
    
    @IBAction func showNextPage(_ sender: UIButton) {
        
        guard let username = nameTextField.text, !username.isEmpty,
        let password = passwordTextField.text, !password.isEmpty else {
            showAlert()
            return
        }
        
        signVM.authenticateUser(username: username, password: Int(password) ?? 0) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success :
                        self.performSegue(withIdentifier: "signSegue", sender: self)
                    case .failure(_):
                  
                        self.showAlert()
                    }
                }
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
          
        }
       
    }


}
