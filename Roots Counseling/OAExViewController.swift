//
//  OAExViewController.swift
//  RootsCapstoneProj
//
//  Created by Abby Allen on 8/31/20.
//  Copyright © 2020 Abby Allen. All rights reserved.
//

import UIKit

class OAExViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var b: UIButton!
    var seg = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all
        
        scrollView.backgroundColor = UIColor.white
        scrollView.delegate = self
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 4.0
        scrollView.zoomScale = 1.0
        
        if seg {
            b.isHidden = true
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return dataView
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
