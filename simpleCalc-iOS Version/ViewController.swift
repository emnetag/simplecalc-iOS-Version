//
//  ViewController.swift
//  simpleCalc-iOS Versiond
//
//  Created by user on 10/21/15.
//  Copyright © 2015 emnetg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var navBar: UINavigationItem!
    
    @IBOutlet weak var inputLabel: UILabel!
    
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var zero: UIButton!
    
    @IBOutlet var nums: [UIButton]!
    
    @IBAction func buttonPressed(sender: UIButton, forevent: UIEvent) {
        print("Just pressed \(sender.titleLabel!.text!)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


