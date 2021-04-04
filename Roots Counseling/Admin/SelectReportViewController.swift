//
//  SelectReportViewController.swift
//  RootsCapstoneProj
//
//  Created by Abby Allen on 8/15/20.
//  Copyright © 2020 Abby Allen. All rights reserved.
//

import UIKit

class SelectReportViewController: UIViewController {
    var user = ""
    var username = ""
    @IBOutlet weak var week: UIButton!
    @IBOutlet weak var crisis: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .portrait
        
        week.layer.cornerRadius = 3.0
        week.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        week.layer.shadowOpacity = 0.3
        week.layer.shadowRadius = 1.0
        
        crisis.layer.cornerRadius = 3.0
        crisis.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        crisis.layer.shadowOpacity = 0.3
        crisis.layer.shadowRadius = 1.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "week"{
            let dest = segue.destination as! AdminWeekViewController
            dest.user = user
            dest.username = username
        }
        else {
            let dest = segue.destination as! CrisisViewController
            dest.user = user
            dest.username = username
        }
    }
}
