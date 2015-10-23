//
//  ViewController.swift
//  simpleCalc-iOS Version
//
//  Created by user on 10/21/15.
//  Copyright © 2015 emnetg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var navBar: UINavigationItem!
    
    @IBAction func textInput(sender: UITextField, forEvent event: UIEvent) {
        if sender.text != nil {
            print("Sender: \(sender.text)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

