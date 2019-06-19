//
//  ViewController.swift
//  comp2125-calculator
//
//  Created by Noor Chaudhry on 2019-05-15.
//  Copyright © 2019 Noor Chaudhry. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    var calculation = Calculations()
    var readyToAcceptNewNumber = false
    var operationPress = false

    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonPressed(_ sender: UIButton) {
        let buttonPressed = sender.currentTitle!
        print("You just pressed: " + buttonPressed)
        
        var currentValue = displayLabel.text! //+ buttonPressed
    
        switch (sender.currentTitle) {
        case "0","1","2","3","4","5","6","7","8","9":
            
            if (currentValue == "0") {
                currentValue = buttonPressed
                operationPress = false
            } else if (operationPress == true){
                currentValue = buttonPressed
                operationPress = false
            } else {
                currentValue += buttonPressed
                operationPress = false
            }
            break
        case "C":
            currentValue = "0"
            calculation.firstNumber = nil
            calculation.secondNumber = nil
            break
        case "+":
            if (calculation.firstNumber != nil){
                calculation.secondNumber = Double(currentValue)
                if let result = calculation.calculateResult(){
                    currentValue = String(format:"%g", result)
                    calculation.firstNumber = result
                    calculation.secondNumber = nil
                } else{
                    currentValue = "Error"
                }
                readyToAcceptNewNumber = true
            } else {
                calculation.operation = sender.currentTitle!
                calculation.firstNumber = Double(currentValue)
                readyToAcceptNewNumber = true
            }
            operationPress = true
            break
        case"=":
            calculation.secondNumber = Double(currentValue)
            if let result = calculation.calculateResult() {
                currentValue = String(format:"%g", result)
            } else {
                currentValue = "Error"
            }
            readyToAcceptNewNumber = true
        default:
            break
    
        }
        displayLabel.text = currentValue
    }
    
}

