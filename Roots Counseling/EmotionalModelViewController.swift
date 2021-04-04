//
//  EmotionalModelViewController.swift
//  RootsCapstoneProj
//
//  Created by Abby Allen on 10/25/20.
//  Copyright © 2020 Abby Allen. All rights reserved.
//

import UIKit

class EmotionalModelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all
    }
    
    @IBAction func back(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "er")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func unwindEM(_ sender: UIStoryboardSegue){}

}
