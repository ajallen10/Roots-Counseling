//
//  SignInViewController.swift
//  RootsCapstoneProj
//
//  Created by Abby Allen on 7/24/20.
//  Copyright © 2020 Abby Allen. All rights reserved.
//

import UIKit
import CoreData
import FirebaseAuth
import FirebaseCore
import FirebaseFirestoreInternal

class SignInViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var start: UIButton!
    var db: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .portrait
        
        start.layer.cornerRadius = 3.0
        start.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        start.layer.shadowOpacity = 0.3
        start.layer.shadowRadius = 1.0
        
        passwordText.delegate = self
        emailText.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordText.resignFirstResponder()
        emailText.resignFirstResponder()
        
        return true
    }
    
    @IBAction func resetPassword(_ sender: Any) {
        let email = getEmailAddress()
        
        if email != "" {
            Auth.auth().sendPasswordReset(withEmail: email) { (error) in
                if let error = error as NSError? {
                self.errorLabel.textColor = UIColor.red
                switch error.code {
                case AuthErrorCode.userNotFound.rawValue:
                    self.errorLabel.text = "User not found"
                case AuthErrorCode.invalidEmail.rawValue:
                    self.errorLabel.text = "Invalid email"
                case AuthErrorCode.invalidRecipientEmail.rawValue:
                    self.errorLabel.text = "Invalid recipient"
                case AuthErrorCode.invalidSender.rawValue:
                    self.errorLabel.text = "Invalid sender"
                case AuthErrorCode.invalidMessagePayload.rawValue:
                    self.errorLabel.text = "Invalid message template"
                default:
                    self.errorLabel.text = "Error message: \(error.localizedDescription)"
                }
              } else {
                self.errorLabel.textColor = UIColor.black
                self.errorLabel.text = "An email has been sent to reset your password"
              }
            }
        }
        else{
            errorLabel.textColor = UIColor.black
            errorLabel.text = "Please provide your email"
        }
        
    }
    
    func getEmailAddress() -> String {
        let email = emailText.text!
        
        if emailText.text == nil {
            return ""
        }
        else {
            return email
        }
    }
    
    @IBAction func signIn(_ sender: Any) {
        let email = emailText.text!
        let password = passwordText.text!
                    
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in guard self != nil else { return }
            if let error = error as NSError? {
                self?.errorLabel.textColor = UIColor.red
                switch error.code {
                    case AuthErrorCode.operationNotAllowed.rawValue:
                        self?.errorLabel.text = "This action is not allowed"
                    case AuthErrorCode.userDisabled.rawValue:
                        self?.errorLabel.text = "This user has been disabled"
                    case AuthErrorCode.wrongPassword.rawValue:
                        self?.errorLabel.text = "Wrong password"
                    case AuthErrorCode.invalidEmail.rawValue:
                        self?.errorLabel.text = "Invalid email"
                    default:
                        self?.errorLabel.text = "\(error.localizedDescription)"
                }
            }
            else {
                Task{
                    let uid: String = Auth.auth().currentUser!.uid
                    let document = try await Firestore.firestore().collection("users").document(uid).getDocument()
//                    debugPrint(doc)
                    do {
//                        let document = try await doc.getDocument()
                        if document.exists {
                            self?.errorLabel.text = "madeit"
                            let docu = document.get("admin")
                            if docu as! Int == 1 {
                                let storyboard = UIStoryboard(name: "Admin", bundle: nil)
                                let mainTabBarController = storyboard.instantiateViewController(identifier: "AdminViewController")
                                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
                            }
                            else {
                                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                let mainTabBarController = storyboard.instantiateViewController(identifier: "MainViewController")
                                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
                            }
                            
                        } else {
                            self?.errorLabel.text = "does not exist"
                        }
                    }
                    
                    self?.errorLabel.textColor = UIColor.green
                    self?.errorLabel.text = "Success!"
                }
            }
        }
    }
    
    @IBAction func unwind(_ sender: UIStoryboardSegue){}
}
