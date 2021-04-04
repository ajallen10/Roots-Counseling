//
//  StopViewController.swift
//  RootsCapstoneProj
//
//  Created by Abby Allen on 11/5/20.
//  Copyright © 2020 Abby Allen. All rights reserved.
//

import UIKit

class StopViewController: UIViewController, UIScrollViewDelegate {

    var report = false
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var dataView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all
        
        if report {
            back.isHidden = false
            doneButton.isHidden = true
        }
        
        scrollView.backgroundColor = UIColor.white
        scrollView.delegate = self
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 4.0
        scrollView.zoomScale = 1.0
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return dataView
    }
    
    @IBAction func done(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "sug")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }

}
