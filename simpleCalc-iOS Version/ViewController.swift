//
//  ViewController.swift
//  simpleCalc-iOS Versiond
//
//  Created by user on 10/21/15.
//  Copyright © 2015 emnetg. All rights reserved.
//

import UIKit

enum MathOps {
    case ADD
    case SUB
    case MULT
    case MOD
    case FACT
    case AVG
    case COUNT
}

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
    
    @IBOutlet weak var addButton: UIButton!
    
    var currentOp: MathOps!
    
    var leftHand: Int = 0
    var rightHand: Int = 0
    
    var currentLabel: String?
    
    var equalsPressed: Bool = false
    
    func convertDouble(incoming: String) -> Double {
        return NSNumberFormatter().numberFromString(incoming)!.doubleValue
    }
    
    func convertInt(incoming: String) -> Int {
        return NSNumberFormatter().numberFromString(incoming)!.integerValue
    }
    
    @IBAction func buttonPressed(sender: UIButton, forevent: UIEvent) {
        if self.inputLabel != nil {
            let buttonString = sender.titleLabel!.text!
            let labelString = self.inputLabel!.text!
            
            if (labelString == "0" || equalsPressed ) {
                self.inputLabel!.text! = buttonString
                equalsPressed = false
            } else {
                self.inputLabel!.text!.appendContentsOf(buttonString)
            }
        }
    }

    @IBAction func addition(sender: UIButton) {
        self.leftHand = convertInt(self.inputLabel!.text!)
        self.inputLabel!.text! = "0"
        
        if self.currentOp == nil {
            self.currentOp = MathOps.ADD
        }
        self.currentOp! = MathOps.ADD
    }
    
    @IBAction func equals(sender: UIButton) {
        self.rightHand = convertInt(self.inputLabel!.text!)
        
        if self.currentOp != nil {
            switch self.currentOp! {
                case .ADD:
                    self.inputLabel!.text! = String(self.leftHand + self.rightHand)
                case .SUB:
                    self.inputLabel!.text! = String(self.leftHand - self.rightHand)
                case .COUNT:
                    print("Not sure what to do yet")
                case .AVG:
                    print("Not sure what to do yet")
                case .MOD:
                    self.inputLabel!.text! = String(self.leftHand % self.rightHand)
                case .FACT:
                    let result = factorial(convertInt(self.inputLabel!.text!))
                    self.inputLabel!.text! = String(result)
                case .MULT:
                    self.inputLabel!.text! = String(self.leftHand * self.rightHand)
            }
        }
        self.equalsPressed = true
    }
    
    func factorial(n: Int) -> Int {
        if n == 0 {
            return 1
        }
        var fact = 1
        for i in 1...n {
            fact = fact * i
        }
        return fact
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


