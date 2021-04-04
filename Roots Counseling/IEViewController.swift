//
//  IEViewController.swift
//  RootsCapstoneProj
//
//  Created by Abby Allen on 7/18/20.
//  Copyright © 2020 Abby Allen. All rights reserved.
//

import UIKit

class IEViewController: UIViewController, UIScrollViewDelegate{
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var dear: UIButton!
    @IBOutlet weak var give: UIButton!
    @IBOutlet weak var fast: UIButton!
    @IBOutlet weak var valid: UIButton!
    @IBOutlet weak var dia: UIButton!
    @IBOutlet weak var pos: UIButton!
    @IBOutlet weak var dime: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .portrait
        
        dear.layer.cornerRadius = 3.0
        dear.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        dear.layer.shadowOpacity = 0.3
        dear.layer.shadowRadius = 1.0
        
        give.layer.cornerRadius = 3.0
        give.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        give.layer.shadowOpacity = 0.3
        give.layer.shadowRadius = 1.0
        
        fast.layer.cornerRadius = 3.0
        fast.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        fast.layer.shadowOpacity = 0.3
        fast.layer.shadowRadius = 1.0
        
        valid.layer.cornerRadius = 3.0
        valid.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        valid.layer.shadowOpacity = 0.3
        valid.layer.shadowRadius = 1.0
        
        dia.layer.cornerRadius = 3.0
        dia.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        dia.layer.shadowOpacity = 0.3
        dia.layer.shadowRadius = 1.0
        
        pos.layer.cornerRadius = 3.0
        pos.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        pos.layer.shadowOpacity = 0.3
        pos.layer.shadowRadius = 1.0
        
        dime.layer.cornerRadius = 3.0
        dime.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        dime.layer.shadowOpacity = 0.3
        dime.layer.shadowRadius = 1.0
        
        scrollView.backgroundColor = UIColor.white
        scrollView.delegate = self
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 4.0
        scrollView.zoomScale = 1.0
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return dataView
    }
    
    @IBAction func back(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "MainViewController")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func dear(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "dearman")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func give(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "give")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func fast(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "fast")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func pos(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "reinforce")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func valid(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "valid")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func dia(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "dialectic")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func dimeG(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "dime")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dia"{
            let dest = segue.destination as! DialecticViewController
            dest.main = true
        }
        else if segue.identifier == "give"{
            let dest = segue.destination as! GiveViewController
            dest.main = true
        }
        else if segue.identifier == "fast"{
            let dest = segue.destination as! FastViewController
            dest.main = true
        }
        else if segue.identifier == "valid"{
            let dest = segue.destination as! ValidateViewController
            dest.main = true
        }
        else if segue.identifier == "pos"{
            let dest = segue.destination as! PosReinforceViewController
            dest.main = true
        }
        else if segue.identifier == "dear"{
            let dest = segue.destination as! DearManViewController
            dest.main = true
        }
    }
}
