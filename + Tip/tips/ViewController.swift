//
//  ViewController.swift
//  tips
//
//  Created by James Taylor on 1/11/15.
//  Copyright (c) 2015 James Taylor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitLabel2: UILabel!
    @IBOutlet weak var splitLabel3: UILabel!
    @IBOutlet weak var splitLabel4: UILabel!
    @IBOutlet weak var splitLabel5: UILabel!
    @IBOutlet weak var splitLabel6: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = ""
        totalLabel.text = ""
        billField.becomeFirstResponder()
}

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        // set segment control values
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        // strip "$" from text field
        var billString = billField.text.stringByReplacingOccurrencesOfString("$", withString: "")

        // convert text input to a number
        var billValue = NSString(string: billString).doubleValue

        // calculate tip & total
        var tip = billValue * tipPercentage
        var total = billValue + tip
        
        // print
        if billValue > 0 {
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
            splitLabel2.text = "/ 2    " + String(format: "$%.2f", total/2)
            splitLabel3.text = "/ 3    " + String(format: "$%.2f", total/3)
            splitLabel4.text = "/ 4    " + String(format: "$%.2f", total/4)
            splitLabel5.text = "/ 5    " + String(format: "$%.2f", total/5)
            splitLabel6.text = "/ 6    " + String(format: "$%.2f", total/6)
        }
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    

}

