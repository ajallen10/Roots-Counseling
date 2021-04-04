//
//  DimeViewController.swift
//  Roots Counseling
//
//  Created by Abby Allen on 1/20/21.
//  Copyright © 2021 Abby Allen. All rights reserved.
//

import UIKit

class DimeViewController: UIViewController {
    @IBOutlet weak var asking: UIButton!
    @IBOutlet weak var sayingNo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        asking.layer.cornerRadius = 3.0
        asking.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        asking.layer.shadowOpacity = 0.3
        asking.layer.shadowRadius = 1.0
        
        sayingNo.layer.cornerRadius = 3.0
        sayingNo.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        sayingNo.layer.shadowOpacity = 0.3
        sayingNo.layer.shadowRadius = 1.0
    }
    
    @IBAction func ask(_ sender: Any) {
        performSegue(withIdentifier: "ask", sender: self)
    }
    
    @IBAction func no(_ sender: Any) {
        performSegue(withIdentifier: "no", sender: self)
    }
    
    @IBAction func unwindDime(_ sender: UIStoryboardSegue){}
}
