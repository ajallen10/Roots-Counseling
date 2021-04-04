//
//  PleaseViewController.swift
//  RootsCapstoneProj
//
//  Created by Abby Allen on 8/17/20.
//  Copyright © 2020 Abby Allen. All rights reserved.
//

import UIKit
import CoreData

class PleaseViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var p: UISegmentedControl!
    @IBOutlet weak var e: UISegmentedControl!
    @IBOutlet weak var a: UISegmentedControl!
    @IBOutlet weak var s: UISegmentedControl!
    @IBOutlet weak var ex: UISegmentedControl!
    @IBOutlet weak var mainMenu: UIButton!
    @IBOutlet weak var nextB: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextB.layer.cornerRadius = 3.0
        nextB.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        nextB.layer.shadowOpacity = 0.3
        nextB.layer.shadowRadius = 1.0
        
        mainMenu.layer.cornerRadius = 3.0
        mainMenu.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        mainMenu.layer.shadowOpacity = 0.3
        mainMenu.layer.shadowRadius = 1.0
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "View", in: context)
        let saveThis = NSManagedObject(entity: entity!, insertInto: context)
        saveThis.setValue("please", forKey: "val")
        
        do{
            try context.save()
        }catch{
            print("Save failed: \(error)")
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
    
    @IBAction func home(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "MainViewController")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! SuggestionViewController
        
        if p.selectedSegmentIndex == 0 {
            dest.p = true
        }
        else {
            dest.p = false
        }
        
        if e.selectedSegmentIndex == 0 {
            dest.e = true
        }
        else {
            dest.e = false
        }
        
        if a.selectedSegmentIndex == 0 {
            dest.a = true
        }
        else {
            dest.a = false
        }
        
        if s.selectedSegmentIndex == 0 {
            dest.s = true
        }
        else {
            dest.s = false
        }
        
        if ex.selectedSegmentIndex == 0 {
            dest.ex = true
        }
        else {
            dest.ex = false
        }
    }
}
