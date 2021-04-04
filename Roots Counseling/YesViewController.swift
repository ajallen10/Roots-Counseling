//
//  YesViewController.swift
//  Roots Counseling
//
//  Created by Abby Allen on 1/22/21.
//  Copyright © 2021 Abby Allen. All rights reserved.
//

import UIKit

class YesViewController: UIViewController {
    @IBOutlet weak var one: UISegmentedControl!
    @IBOutlet weak var two: UISegmentedControl!
    @IBOutlet weak var three: UISegmentedControl!
    @IBOutlet weak var four: UISegmentedControl!
    @IBOutlet weak var five: UISegmentedControl!
    @IBOutlet weak var six: UISegmentedControl!
    @IBOutlet weak var seven: UISegmentedControl!
    @IBOutlet weak var eight: UISegmentedControl!
    @IBOutlet weak var nine: UISegmentedControl!
    @IBOutlet weak var ten: UISegmentedControl!
    @IBOutlet weak var n: UIButton!
    var sum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        n.layer.cornerRadius = 3.0
        n.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        n.layer.shadowOpacity = 0.3
        n.layer.shadowRadius = 1.0
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if one.selectedSegmentIndex == 0 {
            sum += 1
        }
        if two.selectedSegmentIndex == 0 {
            sum += 1
        }
        if three.selectedSegmentIndex == 0 {
            sum += 1
        }
        if four.selectedSegmentIndex == 0 {
            sum += 1
        }
        if five.selectedSegmentIndex == 0 {
            sum += 1
        }
        if six.selectedSegmentIndex == 0 {
            sum += 1
        }
        if seven.selectedSegmentIndex == 0 {
            sum += 1
        }
        if eight.selectedSegmentIndex == 0 {
            sum += 1
        }
        if nine.selectedSegmentIndex == 0 {
            sum += 1
        }
        if ten.selectedSegmentIndex == 0 {
            sum += 1
        }
        
        performSegue(withIdentifier: "segYes", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! DimeResultViewController
        dest.num = sum
        dest.c = "yes"
    }
}
