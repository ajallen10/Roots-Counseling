//
//  MindfulnessViewController.swift
//  RootsCapstoneProj
//
//  Created by Abby Allen on 7/17/20.
//  Copyright © 2020 Abby Allen. All rights reserved.
//

import UIKit

class MindfulnessViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var wise: UIButton!
    @IBOutlet weak var ob: UIButton!
    @IBOutlet weak var des: UIButton!
    @IBOutlet weak var part: UIButton!
    @IBOutlet weak var non: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var eff: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .portrait
        
        wise.layer.cornerRadius = 3.0
        wise.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        wise.layer.shadowOpacity = 0.3
        wise.layer.shadowRadius = 1.0
        
        ob.layer.cornerRadius = 3.0
        ob.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        ob.layer.shadowOpacity = 0.3
        ob.layer.shadowRadius = 1.0
        
        des.layer.cornerRadius = 3.0
        des.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        des.layer.shadowOpacity = 0.3
        des.layer.shadowRadius = 1.0
        
        part.layer.cornerRadius = 3.0
        part.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        part.layer.shadowOpacity = 0.3
        part.layer.shadowRadius = 1.0
        
        non.layer.cornerRadius = 3.0
        non.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        non.layer.shadowOpacity = 0.3
        non.layer.shadowRadius = 1.0
        
        one.layer.cornerRadius = 3.0
        one.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        one.layer.shadowOpacity = 0.3
        one.layer.shadowRadius = 1.0
        
        eff.layer.cornerRadius = 3.0
        eff.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        eff.layer.shadowOpacity = 0.3
        eff.layer.shadowRadius = 1.0
        
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
    
    @IBAction func wise(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "wise")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func observe(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "observe")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func describe(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "describe")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func part(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "participate")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func non(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "nojudge")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func one(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "onemind")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func effective(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "effective")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "effective"{
            let dest = segue.destination as! EffectiveViewController
            dest.main = true
        }
        else if segue.identifier == "one"{
            let dest = segue.destination as! OneMindViewController
            dest.main = true
        }
        else if segue.identifier == "non"{
            let dest = segue.destination as! NonjudgementalViewController
            dest.main = true
        }
        else if segue.identifier == "part"{
            let dest = segue.destination as! ParticipateViewController
            dest.main = true
        }
        else if segue.identifier == "describe"{
            let dest = segue.destination as! DescribeViewController
            dest.main = true
        }
        else if segue.identifier == "observe"{
            let dest = segue.destination as! ObserveViewController
            dest.main = true
        }
        else if segue.identifier == "wise"{
            let dest = segue.destination as! WiseMindViewController
            dest.main = true
        }
    }
}
