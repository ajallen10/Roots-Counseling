//
//  RadicalViewController.swift
//  RootsCapstoneProj
//
//  Created by Abby Allen on 9/7/20.
//  Copyright © 2020 Abby Allen. All rights reserved.
//

import UIKit

class RadicalViewController: UIViewController {
    var report = false
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all
        
        if report {
            back.isHidden = false
            doneButton.isHidden = true
        }
    }
    
    @IBAction func done(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "MainViewController")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
}
