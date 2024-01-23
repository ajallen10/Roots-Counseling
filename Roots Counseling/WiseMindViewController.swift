//
//  WiseMindViewController.swift
//  RootsCapstoneProj
//
//  Created by Abby Allen on 9/14/20.
//  Copyright © 2020 Abby Allen. All rights reserved.
//

import UIKit

class WiseMindViewController: UIViewController, UIScrollViewDelegate {
    var report = false
    var main = false
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var emo: UIButton!
    @IBOutlet weak var wise: UIButton!
    @IBOutlet weak var logic: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all
        
        if report {
            back.isHidden = false
            doneButton.isHidden = true
        }
        else if main {
            back.isHidden = true
            doneButton.isHidden = true
        }
    }
    
    
    @IBAction func emoAct(_ sender: Any) {
    }
    @IBAction func wiseAct(_ sender: Any) {
    }
    @IBAction func logicAct(_ sender: Any) {
    }
    
    @IBAction func done(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "sug")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }

}
