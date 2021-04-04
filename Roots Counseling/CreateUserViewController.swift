//
//  CreateUserViewController.swift
//  RootsCapstoneProj
//
//  Created by Abby Allen on 7/28/20.
//  Copyright © 2020 Abby Allen. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth
import FirebaseDatabase

class CreateUserViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirm: UITextField!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var isRoots: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .portrait
        
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        
        createButton.layer.cornerRadius = 3.0
        createButton.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        createButton.layer.shadowOpacity = 0.3
        createButton.layer.shadowRadius = 1.0
        
        name.delegate = self
        email.delegate = self
        password.delegate = self
        confirm.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        name.resignFirstResponder()
        email.resignFirstResponder()
        password.resignFirstResponder()
        confirm.resignFirstResponder()
        
        return true
    }
    
    @IBAction func create(_ sender: Any) {
        let em = email.text!
        let user = name.text!
        let last9 = String(user.suffix(9))
        
        if password.text! == confirm.text! && last9 != "Therapist" {
            let pass = password.text!
            
            Auth.auth().createUser(withEmail: em, password: pass) { authResult, error in
                if let error = error as NSError? {
                    self.message.textColor = UIColor.red
                    
                    switch AuthErrorCode(rawValue: error.code) {
                        case .operationNotAllowed:
                            self.message.text = "That operation is not allowed"
                        case .emailAlreadyInUse:
                            self.message.text = "The email you provided is already in use"
                        case .invalidEmail:
                            self.message.text = "Invalid email"
                        case .weakPassword:
                            self.message.text = "Weak password, password must be at least 6 characters long"
                        default:
                            self.message.text = "\(error.localizedDescription)"
                    }
                }
                else {
                    self.message.textColor = UIColor.black
                    self.message.text = "Success! Logging you in..."
                    
                    let userCurrent = Auth.auth().currentUser
                    
                    if let userCurrent = userCurrent {
                            let changeRequest = userCurrent.createProfileChangeRequest()
                            changeRequest.displayName = user
                        
                            changeRequest.commitChanges { error in
                            if let error = error {
                                print("Error: \(error)")
                            } else {
                               print("Profile Updated")
                            }
                        }
                     }
                    
                    let db = Firestore.firestore()
                    let uid: String = Auth.auth().currentUser!.uid
                    
                    if self.isRoots.selectedSegmentIndex == 0 {
                        db.collection("users").document(uid).setData(["name": user, "roots": true, "admin": false, "week": 1])
                    }
                    else {
                        db.collection("users").document(uid).setData(["name": user, "roots": false, "admin": false, "week": 1])
                    }
                }
            }
        }
        else if password.text! != confirm.text! {
            message.textColor = UIColor.red
            message.text = "Passwords do not match"
        }
        else {
            message.textColor = UIColor.red
            message.text = "Invalid username"
        }
    }
}
