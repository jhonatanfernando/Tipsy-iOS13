//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPcButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var slplitNumberLabel: UILabel!
    
    var perc: Int = 0
    var totalValue: Float = 0.00
    
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        zeroPcButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true;
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        slplitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    
    @IBAction func calculatePressed(_ sender: Any) {
        
        let billValue = Float(billTextField.text ?? "0")!
        let splitValue =  Float(slplitNumberLabel.text ?? "0")!
        
        perc = 0
        if tenPctButton.isSelected {
            perc = 10
        }
        else if twentyPctButton.isSelected {
            perc = 20
        }
        
        totalValue = (billValue + (billValue * Float(perc) / 100.0)) / splitValue
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = (segue.destination as! ResultsViewController)
        
        destinationVC.numberOfPeople = slplitNumberLabel.text ?? "1"
        destinationVC.tipPercentage = String(perc)
        destinationVC.total = String(format: "%.2f", totalValue)
        
        
    }
    
    
}

