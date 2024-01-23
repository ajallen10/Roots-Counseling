//
//  DTViewController.swift
//  RootsCapstoneProj
//
//  Created by Abby Allen on 7/18/20.
//  Copyright © 2020 Abby Allen. All rights reserved.
//

import UIKit

class DTViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var accepts: UIButton!
    @IBOutlet weak var soothe: UIButton!
    @IBOutlet weak var pros: UIButton!
    @IBOutlet weak var improve: UIButton!
    @IBOutlet weak var tipp: UIButton!
    @IBOutlet weak var rad: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .portrait
        
        accepts.layer.cornerRadius = 3.0
        accepts.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        accepts.layer.shadowOpacity = 0.3
        accepts.layer.shadowRadius = 1.0
        
        improve.layer.cornerRadius = 3.0
        improve.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        improve.layer.shadowOpacity = 0.3
        improve.layer.shadowRadius = 1.0
        
        soothe.layer.cornerRadius = 3.0
        soothe.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        soothe.layer.shadowOpacity = 0.3
        soothe.layer.shadowRadius = 1.0
        
        pros.layer.cornerRadius = 3.0
        pros.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        pros.layer.shadowOpacity = 0.3
        pros.layer.shadowRadius = 1.0
        
        tipp.layer.cornerRadius = 3.0
        tipp.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        tipp.layer.shadowOpacity = 0.3
        tipp.layer.shadowRadius = 1.0
        
        rad.layer.cornerRadius = 3.0
        rad.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        rad.layer.shadowOpacity = 0.3
        rad.layer.shadowRadius = 1.0
        
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
    
    @IBAction func pdf(_ sender: Any) {
        performSegue(withIdentifier: "distPDF", sender: self)
    }
    @IBAction func accepts(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "accepts")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func soothe(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "soothe")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func improve(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "improve")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func pros(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "pros")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func tipp(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "tipp")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func radical(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "radical")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "rad"{
            let dest = segue.destination as! RadicalAcceptViewController
            dest.main = true
        }
        else if segue.identifier == "tipp"{
            let dest = segue.destination as! TippViewController
            dest.main = true
        }
        else if segue.identifier == "pros"{
            let dest = segue.destination as! ProsViewController
            dest.main = true
        }
        else if segue.identifier == "improve"{
            let dest = segue.destination as! ImproveViewController
            dest.main = true
        }
        else if segue.identifier == "soothe"{
            let dest = segue.destination as! SootheViewController
            dest.main = true
        }
        else if segue.identifier == "accepts"{
            let dest = segue.destination as! AcceptsViewController
            dest.main = true
        }
    }
}
