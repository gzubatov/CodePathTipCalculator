//
//  ViewController.swift
//  tipster
//
//  Created by Greg Zubatov on 12/28/18.
//  Copyright © 2018 Greg Zubatov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var customTipLabel: UILabel!
    @IBOutlet weak var customTipField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let tipPercentages = [0.18, 0.2, 0.22]
        
        let tipControlSelection = tipControl.selectedSegmentIndex
        
        let bill = Double(billField.text!) ?? 0
        
        var tip = 0.0
        
        if tipControlSelection == 3 {
            var customTip = Double(customTipField.text!) ?? 0.0
            customTip = customTip / 100.0
            tip = bill * customTip
        } else {
            tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        }
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    
    @IBAction func customTipFieldVisible(_ sender: Any) {
        if tipControl.selectedSegmentIndex == 3 {
            customTipField.isHidden = false
            customTipLabel.isHidden = false
        }
        else {
            customTipField.isHidden = true
            customTipLabel.isHidden = true
        }
    }
}

