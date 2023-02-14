//
//  ViewController.swift
//  Calculator2
//
//  Created by Helen Hoang on 2/13/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberDisplay: UILabel!
    var numberOnScreen = 0.0
    var previousNumber = 0.0
    var performingMath = false
    var currentOperation:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateDisplay()
    }
    // make a function that simply refresh the display
    func updateDisplay() {
        numberDisplay.text = "\(numberOnScreen)"
    }
    
    func clearCal() {
        
        numberOnScreen = 0.0
        previousNumber = 0.0
        currentOperation = ""
    }
    
    @IBAction func clearPressed(_ sender: Any) {
        clearCal()
        updateDisplay()
        
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton)
    {
        guard let digit = Double(sender.titleLabel!.text!) else
        {
            return
        }
        if performingMath == true {
            numberOnScreen = 0.0
            performingMath = false
            
        } else {
            numberOnScreen *= 10
        }
        numberOnScreen += digit
        updateDisplay()
    }
    
    
    @IBAction func persentButtonPressed(_ sender: UIButton) {
        let digit = numberOnScreen * 0.01
        numberOnScreen = digit
        updateDisplay()
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton)
    {
        let tmpOperation: String? = sender.titleLabel!.text!
        guard let tmpOperation = tmpOperation else
        {
            return
        }
        currentOperation = tmpOperation
        previousNumber = numberOnScreen
        performingMath = true
    }
    
    func operations()
    {
        performingMath = true
        var digit = 0.0
        if currentOperation == "+"
        {
            digit = previousNumber + numberOnScreen
        } else if currentOperation == "-" {
            digit = previousNumber - numberOnScreen
        } else if currentOperation == "*" {
            digit = previousNumber * numberOnScreen
        } else if currentOperation == "/" {
            digit = previousNumber / numberOnScreen
        } else {
            return
        }
        numberOnScreen = digit
        updateDisplay()
    }
    
    @IBAction func equalButtonPressed(_ sender: UIButton) {
        let tmpOperation: String? = sender.titleLabel!.text!
        guard let tmpOperation = tmpOperation else
        {
            return
        }
        operations()
    }
}

