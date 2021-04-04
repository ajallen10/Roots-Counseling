//
//  OppositeViewController.swift
//  RootsCapstoneProj
//
//  Created by Abby Allen on 8/28/20.
//  Copyright © 2020 Abby Allen. All rights reserved.
//

import UIKit

class OppositeViewController: UIViewController, UIScrollViewDelegate {
    var model = false
    var main = false
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all
        
        if model {
            doneButton.isHidden = true
        }
        else if main {
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ex" && main {
            let dest = segue.destination as! OAExViewController
            dest.seg = true
        }
    }
}
