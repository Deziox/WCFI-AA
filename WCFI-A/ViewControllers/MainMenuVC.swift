//
//  ViewController.swift
//  WCFI-A
//
//  Created by Danzel Serrano on 11/14/20.
//

import UIKit
import Firebase

class MainMenuVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        WCFIBase.initializeDB()
    }
    
    @IBAction func attendance(_ sender: UIButton) {
        performSegue(withIdentifier: "attendance", sender: nil)
    }

}

