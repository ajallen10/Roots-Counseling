//
//  DimeResultViewController.swift
//  Roots Counseling
//
//  Created by Abby Allen on 1/22/21.
//  Copyright © 2021 Abby Allen. All rights reserved.
//

import UIKit

class DimeResultViewController: UIViewController {
    @IBOutlet weak var done: UIButton!
    @IBOutlet weak var choice: UILabel!
    @IBOutlet weak var suggest: UILabel!
    var num = 0
    var c = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if c == "no" {
            choice.text = "VALUE OF SAYING NO"
            
            if num == 0 || num == 1 {
                suggest.text = "0-10¢: Do it without being asked."
            }
            else if num == 2 {
                suggest.text = "20¢: Don't complain; do it cheerfully."
            }
            else if num == 3 {
                suggest.text = "30¢: Do it, even if you're not cheerful about it."
            }
            else if num == 4 {
                suggest.text = "40¢: Do it, but show that you'd rather not."
            }
            else if num == 5 {
                suggest.text = "50¢: Say you'd rather not, but do it gracefully."
            }
            else if num == 6 {
                suggest.text = "60¢: Say no firmly, but reconsider."
            }
            else if num == 7 {
                suggest.text = "70¢: Say no confidently; resist saying yes."
            }
            else if num == 8 {
                suggest.text = "80¢: Say no firmly; resist saying yes."
            }
            else if num == 9 {
                suggest.text = "90¢: Say no firmly; resist; negotiate."
            }
            else if num == 10 {
                suggest.text = "$1.00: Don't do it."
            }
        }
        else {
            choice.text = "VALUE OF ASKING"
            
            if num == 0 || num == 1{
                suggest.text = "0-10¢: Don't ask; don't hint."
            }
            else if num == 2 {
                suggest.text = "20¢: Hint indirectly; take no."
            }
            else if num == 3 {
                suggest.text = "30¢: Hint openly; take no."
            }
            else if num == 4 {
                suggest.text = "40¢: Ask tentatively; take no."
            }
            else if num == 5 {
                suggest.text = "50¢: Ask gracefully, but take no."
            }
            else if num == 6 {
                suggest.text = "60¢: Ask confidently; take no."
            }
            else if num == 7 {
                suggest.text = "70¢: Ask confidently; resist no."
            }
            else if num == 8 {
                suggest.text = "80¢: Ask firmly; resist no."
            }
            else if num == 9 {
                suggest.text = "90¢: Ask firmly; insist; negotiate; keep trying."
            }
            else if num == 10 {
                suggest.text = "$1.00: Don't take no for an answer."
            }
        }
        
        done.layer.cornerRadius = 3.0
        done.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        done.layer.shadowOpacity = 0.3
        done.layer.shadowRadius = 1.0
    }

    @IBAction func ie(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "IEnav")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
}
