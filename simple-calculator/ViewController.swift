//
//  ViewController.swift
//  simple-calculator
//
//  Created by Anish Dhungel on 5/3/18.
//  Copyright © 2018 Anish Dhungel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var screenLabel: UILabel!
    var numbers : String = ""
    var prevNumbers: String = ""
    var calc : Bool = false
    var pressedEqual = false
    var operation : Int?
    var isOperation = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if pressedEqual == true && isOperation == false  && sender.tag < 10{
            reset()
            let temp = "\(sender.tag)"
            screenLabel.text = temp
            pressedEqual = false
        }
        if sender.tag == 10 {
            reset()
        }
        
        if sender.tag != 17 && sender.tag !=  10 {
            if  sender.tag < 10 {
                numbers += "\(sender.tag)"
                screenLabel.text = numbers
            }
            
            
            if sender.tag == 16 {
                prevNumbers = numbers
                calc = true
                numbers = ""
                operation = sender.tag
                pressedEqual = false
                isOperation = true
            }
        } else if calc == true && sender.tag == 17  {
            print("\(prevNumbers) \(operation!) \(numbers)")
            print("Equal sign")
            calc = false
            if operation == 16 {
                let result: Int = Int(prevNumbers)! + Int(numbers)!
                print("addition", result)
                screenLabel.text = "\(result)"
                numbers = "\(result)"
                pressedEqual = true
                isOperation = false
            }
        }
    }
    func reset () {
        screenLabel.text = "0"
        numbers = ""
        prevNumbers = ""
        calc  = false
    }
}

