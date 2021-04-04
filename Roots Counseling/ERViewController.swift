//
//  ERViewController.swift
//  RootsCapstoneProj
//
//  Created by Abby Allen on 7/18/20.
//  Copyright © 2020 Abby Allen. All rights reserved.
//

import UIKit

class ERViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var em: UIButton!
    @IBOutlet weak var ident: UIButton!
    @IBOutlet weak var pa: UIButton!
    @IBOutlet weak var vals: UIButton!
    @IBOutlet weak var long: UIButton!
    @IBOutlet weak var b: UIButton!
    @IBOutlet weak var c: UIButton!
    @IBOutlet weak var pls: UIButton!
    @IBOutlet weak var oa: UIButton!
    @IBOutlet weak var facts: UIButton!
    @IBOutlet weak var solve: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .portrait
        
        em.layer.cornerRadius = 3.0
        em.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        em.layer.shadowOpacity = 0.3
        em.layer.shadowRadius = 1.0
        
        ident.layer.cornerRadius = 3.0
        ident.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        ident.layer.shadowOpacity = 0.3
        ident.layer.shadowRadius = 1.0
        
        pa.layer.cornerRadius = 3.0
        pa.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        pa.layer.shadowOpacity = 0.3
        pa.layer.shadowRadius = 1.0
        
        vals.layer.cornerRadius = 3.0
        vals.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        vals.layer.shadowOpacity = 0.3
        vals.layer.shadowRadius = 1.0
        
        long.layer.cornerRadius = 3.0
        long.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        long.layer.shadowOpacity = 0.3
        long.layer.shadowRadius = 1.0
        
        b.layer.cornerRadius = 3.0
        b.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        b.layer.shadowOpacity = 0.3
        b.layer.shadowRadius = 1.0
        
        c.layer.cornerRadius = 3.0
        c.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        c.layer.shadowOpacity = 0.3
        c.layer.shadowRadius = 1.0
        
        pls.layer.cornerRadius = 3.0
        pls.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        pls.layer.shadowOpacity = 0.3
        pls.layer.shadowRadius = 1.0
        
        oa.layer.cornerRadius = 3.0
        oa.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        oa.layer.shadowOpacity = 0.3
        oa.layer.shadowRadius = 1.0
        
        facts.layer.cornerRadius = 3.0
        facts.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        facts.layer.shadowOpacity = 0.3
        facts.layer.shadowRadius = 1.0
        
        solve.layer.cornerRadius = 3.0
        solve.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        solve.layer.shadowOpacity = 0.3
        solve.layer.shadowRadius = 1.0
        
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
    
    @IBAction func model(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "model")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func label(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "emotion")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func pleasant(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "pleasant")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func vals(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "values")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func goals(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "long")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func build(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "build")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    @IBAction func cope(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "cope")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func please(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "pleaseSkill")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func opp(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "opposite")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func facts(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "facts")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func solve(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "solve")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "solve"{
            let dest = segue.destination as! SolveViewController
            dest.main = true
        }
        else if segue.identifier == "facts"{
            let dest = segue.destination as! FactsViewController
            dest.main = true
        }
        else if segue.identifier == "please"{
            let dest = segue.destination as! PleaseSkillViewController
            dest.main = true
        }
        else if segue.identifier == "opp"{
            let dest = segue.destination as! OppositeViewController
            dest.main = true
        }
        else if segue.identifier == "cope"{
            let dest = segue.destination as! CopingViewController
            dest.main = true
        }
        else if segue.identifier == "build"{
            let dest = segue.destination as! BuildViewController
            dest.main = true
        }
        else if segue.identifier == "long"{
            let dest = segue.destination as! LongTermViewController
            dest.main = true
        }
        else if segue.identifier == "vals"{
            let dest = segue.destination as! ValsAndPriorsViewController
            dest.main = true
        }
        else if segue.identifier == "pleasant"{
            let dest = segue.destination as! PleasantViewController
            dest.main = true
        }
        else if segue.identifier == "label"{
            let dest = segue.destination as! EmotionsViewController
            dest.main = true
        }
    }

}
