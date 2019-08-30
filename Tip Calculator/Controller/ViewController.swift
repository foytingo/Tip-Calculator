//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Foytingo on 30.08.2019.
//  Copyright © 2019 Foytingo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipPrice: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var tipPercent: UISlider!
    
    let calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneClicked))
        
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        price.inputAccessoryView = toolBar
    }
    
    @IBAction func tipPercentSlider(_ sender: UISlider) {
        
        calculator.tipPercentAmount = Int(sender.value)
        tipLabel.text = "Tip (\(calculator.tipPercentAmount)%)"
        updateUI()
 
     }
    
    @objc func doneClicked(){
        view.endEditing(true)
        
        if let bill = Double(price.text!) {
            calculator.biller = bill
            price.text = calculator.convertDoubleToCurrency(amount: bill)
            updateUI()
        } else {
            print("Not a valid number: \(price.text!)")
        }
   
    }

    func updateUI() {
        tipPrice.text = calculator.tipCalculator()
        totalPrice.text = calculator.totalPriceCalculator()
    }
}



