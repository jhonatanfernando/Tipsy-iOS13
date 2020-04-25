//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Jhonatan Fernando on 2020-04-25.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    var numberOfPeople: String = ""
    var tipPercentage: String = ""
    var total: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        totalLabel.text = total
        
        settingLabel.text = "Split between \(numberOfPeople) people, with (\(tipPercentage))% tip."
        
    }
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion:  nil)
    }
}
