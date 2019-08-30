//
//  Calculator.swift
//  Tip Calculator
//
//  Created by Foytingo on 30.08.2019.
//  Copyright © 2019 Foytingo. All rights reserved.
//

import Foundation

class Calculator{
    
    var tipPercentAmount : Int = 15
    var biller : Double = 0
    var totalPriceAmountText : String = ""
    var tipAmounText : String = ""
    

    func tipCalculator() -> String {
        tipAmounText = convertDoubleToCurrency(amount: biller*Double(tipPercentAmount) / 100)
        return tipAmounText
    }
    
    func totalPriceCalculator() -> String {
        totalPriceAmountText = convertDoubleToCurrency(amount: biller + biller * Double(tipPercentAmount) / 100)
        return totalPriceAmountText
    }
    
    func convertDoubleToCurrency(amount: Double) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        return numberFormatter.string(from: NSNumber(value: amount))!
    }
    
}
