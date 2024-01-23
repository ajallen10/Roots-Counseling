//
//  AdminLogoutViewController.swift
//  RootsCapstoneProj
//
//  Created by Abby Allen on 7/28/20.
//  Copyright © 2020 Abby Allen. All rights reserved.
//

import UIKit
import FirebaseAuth

class AdminLogoutViewController: UIViewController {
    @IBOutlet weak var logout: UIButton!
    @IBOutlet weak var newTherapist: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .portrait
        
        logout.layer.cornerRadius = 3.0
        logout.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        logout.layer.shadowOpacity = 0.3
        logout.layer.shadowRadius = 1.0
        
        newTherapist.layer.cornerRadius = 3.0
        newTherapist.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        newTherapist.layer.shadowOpacity = 0.3
        newTherapist.layer.shadowRadius = 1.0
    }
    
    @IBAction func logout(_ sender: Any) {
           do {
             try Auth.auth().signOut()
           } catch {
             print("Sign out error")
           }
           
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           let loginNavController = storyboard.instantiateViewController(identifier: "SignInViewController")

           (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginNavController)
       }
    
    @IBAction func unwindMore(_ sender: UIStoryboardSegue){}

}
