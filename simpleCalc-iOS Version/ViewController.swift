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
    case DIV
    case MULT
    case MOD
    case AVG
    case COUNT
}

class ViewController: UIViewController {
    
    @IBOutlet weak var inputLabel: UILabel!

    var currentOp: MathOps!

    var leftHand: Int = 0
    
    var rightHand: Int = 0
    
    var equalsPressed: Bool = false
    
    var numbers: [Int] = [Int]()
    
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
    
    
    @IBAction func subtract(sender: UIButton) {
        self.leftHand = convertInt(self.inputLabel!.text!)
        self.inputLabel!.text! = "0"
        
        if self.currentOp == nil {
            self.currentOp = MathOps.SUB
        }
        self.currentOp! = MathOps.SUB
    }
    
    @IBAction func multiply(sender: UIButton) {
        self.leftHand = convertInt(self.inputLabel!.text!)
        self.inputLabel!.text! = "0"
        
        if self.currentOp == nil {
            self.currentOp = MathOps.MULT
        }
        self.currentOp! = MathOps.MULT
        
    }
    
    @IBAction func divide(sender: UIButton) {
        self.leftHand = convertInt(self.inputLabel!.text!)
        self.inputLabel!.text! = "0"
        
        if self.currentOp == nil {
            self.currentOp = MathOps.DIV
        }
        self.currentOp! = MathOps.DIV
    }
    
    
    @IBAction func countButton(sender: UIButton) {
        if self.currentOp == nil {
            self.currentOp = MathOps.COUNT
        }
        self.currentOp! = MathOps.COUNT

        let num = convertInt(self.inputLabel!.text!)
        numbers.append(num)
        self.inputLabel!.text! = "0"
    }
    
    @IBAction func avgButton(sender: UIButton) {
        if self.currentOp == nil {
            self.currentOp = MathOps.AVG
        }
        self.currentOp! = MathOps.AVG
        
        let num = convertInt(self.inputLabel!.text!)
        numbers.append(num)
        self.inputLabel!.text! = "0"
        
    }
    
    @IBAction func equals(sender: UIButton) {
        self.rightHand = convertInt(self.inputLabel!.text!)
        
        if self.currentOp != nil {
            switch self.currentOp! {
                case .ADD:
                    self.inputLabel!.text! = String(self.leftHand + self.rightHand)
                case .SUB:
                    self.inputLabel!.text! = String(self.leftHand - self.rightHand)
                case .MULT:
                    self.inputLabel!.text! = String(self.leftHand * self.rightHand)
                case .DIV:
                    self.inputLabel!.text! = String(self.leftHand / self.rightHand)
                case .MOD:
                    self.inputLabel!.text! = String(self.leftHand % self.rightHand)
                case .AVG:
                    self.numbers.append(rightHand)
                    self.inputLabel!.text! = String(avg(self.numbers))
                case .COUNT:
                    self.inputLabel!.text! = String("\(countResult(self.numbers))")
            }
        }
        self.equalsPressed = true
    }
    
    @IBAction func factButton(sender: UIButton) {
        let number = convertInt(self.inputLabel!.text!)
        self.inputLabel!.text! = String(factorial(number))
    }
    
    
    func factorial(n: Int) -> Int {
        if n == 0 {
            return 1
        }
        var fact = 1
        for i in 1...n {
            fact *= i
        }
        return fact
    }
    
    func countResult(nums: [Int]) -> Int {
        self.numbers = [Int]()
        return nums.count
    }
    
    func avg(numbers: [Int]) -> Double {
        var sum: Int = 0
        for number in numbers { sum += number }
        return Double(sum / numbers.count)
    }
    
    
    @IBAction func clearText(sender: UIButton) {
        self.leftHand = 0
        self.rightHand = 0
        self.numbers = [Int]()
        self.equalsPressed = false
        self.inputLabel!.text! = "0"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


