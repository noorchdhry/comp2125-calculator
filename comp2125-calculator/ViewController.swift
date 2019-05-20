//
//  ViewController.swift
//  comp2125-calculator
//
//  Created by Noor Chaudhry on 2019-05-15.
//  Copyright © 2019 Noor Chaudhry. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

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
            currentValue = currentValue + buttonPressed
        
            if(currentValue == "0"){
                currentValue = buttonPressed
            } else {
                currentValue += buttonPressed
            }
            break
        default:
            break
    
        }
    }
    
}

