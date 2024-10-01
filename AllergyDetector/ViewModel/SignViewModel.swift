//
//  SignViewModel.swift
//  AllergyDetector
//
//  Created by Fatma Zehra Fadıl on 9.09.2024.
//

import Foundation
import FirebaseDatabase

class SignViewModel {
    
        private var ref: DatabaseReference

        init() {
           ref = Database.database().reference()
        }

       // Kullanıcı adı ve şifre ile Firebase'den doğrulama yapma
    func authenticateUser(username: String, password: Int, completion: @escaping (Result<Any, Error>) -> Void) {
           
            ref.child("Patient").observeSingleEvent(of: .value) { snapshot,arg in
                if let usersArray = snapshot.value as? [[String: Any]] {
                    // Kullanıcıları tarayarak doğru kullanıcıyı bulma
                    for userInfo in usersArray {
                        if let dbUsername = userInfo["name"] as? String,
                           let dbPassword = userInfo["password"] as? Int,
                           dbUsername == username, dbPassword == password {
                            self.setValuesFromDB(data: userInfo)
                            completion(.success(true))
                            return
                        }
                    }
                    // Kullanıcı adı veya şifre bulunamazsa hata döndür
                    let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Kullanıcı adı veya şifre hatalı."])
                    completion(.failure(error))
                } else {
                    let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Veri yapılamadı."])
                    completion(.failure(error))
                }
            } withCancel: { error in
                completion(.failure(error))  // Firebase'den veri çekme hatası
            }
        }

  
        func setValuesFromDB(data : [String: Any]) {
          
            Patient.sharedPatient.setValues(name: data["name"] as? String,
                          surname: data["surname"] as? String,
                            age: data["age"] as? Int,
                            gender: data["gender"] as? String,
                            allergyInfo: data["allergyInfo"] as? [String],
                            password: data["password"] as? Int,
                            personalId: data["personalId"] as? Int,
                            height: data["height"] as? Int,
                            weight: data["weight"] as? Int,
                            blood: data["blood"] as? String)
                                            
        }

    
}
