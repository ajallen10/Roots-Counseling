//
//  EMStepsViewController.swift
//  RootsCapstoneProj
//
//  Created by Abby Allen on 10/25/20.
//  Copyright © 2020 Abby Allen. All rights reserved.
//

import UIKit

class EMStepsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .portrait
    }
    
    @IBAction func opposite(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "opposite")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func solve(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "solve")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func distract(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "accepts")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func facts(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "facts")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func describe(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "emotion")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func a(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "long")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func b(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "build")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func c(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "cope")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func please(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "pleaseSkill")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dist" {
            let dest = segue.destination as! AcceptsViewController
            dest.main = true
        }
        else if segue.identifier == "solve" {
            let dest = segue.destination as! SolveViewController
            dest.main = true
        }
        else if segue.identifier == "facts" {
            let dest = segue.destination as! FactsViewController
            dest.main = true
        }
        else if segue.identifier == "please" {
            let dest = segue.destination as! PleaseSkillViewController
            dest.main = true
        }
        else if segue.identifier == "a" {
            let dest = segue.destination as! LongTermViewController
            dest.main = true
        }
        else if segue.identifier == "b" {
            let dest = segue.destination as! BuildViewController
            dest.main = true
        }
        else if segue.identifier == "c" {
            let dest = segue.destination as! CopingViewController
            dest.main = true
        }
        else if segue.identifier == "describe" {
            let dest = segue.destination as! DescribeViewController
            dest.main = true
        }
        else if segue.identifier == "opp" {
            let dest = segue.destination as! OppositeViewController
            dest.main = true
        }
    }
}
