//
//  ButtonValue.swift
//  Calculator
//
//  Created by Steven Wijaya on 12.02.2022.
//

import Foundation

final class CalculationModel: ObservableObject {
    @Published var firstNumber = "0"
    @Published var value = "0"
    var currentOperator: ButtonValue = .none
    
    @Published var isDecimal: Bool = false
    
    func getFinalResult(decimal: Double) -> String {
        let formatter = NumberFormatter()
        let result = round(decimal * pow(10, 9))/pow(10, 9)     //To fix error like 0.1+0.2 = 0.30000000004
        
        formatter.usesSignificantDigits = true
        formatter.maximumSignificantDigits = 10                 // To make it dynamic size of floating point
        
        if (floor(result) == result) {
            self.isDecimal = false
            return String(Int(result))
        } else {
            self.isDecimal = true
            return formatter.string(from: NSNumber(value: result))!
        }
    }
    
    func receiveInput(item: ButtonValue) {
        switch item {
        case .add, .subtract, .multiply, .divide:
            self.firstNumber = self.value
            self.currentOperator = item
            self.value = "0"
        case .equal:
            switch self.currentOperator {
            case .add:
                let result = Double(self.firstNumber)! + Double(self.value)!
                self.value = getFinalResult(decimal: result)
            case .subtract:
                let result = Double(self.firstNumber)! - Double(self.value)!
                self.value = getFinalResult(decimal: result)
            case .multiply:
                let result = Double(self.firstNumber)! * Double(self.value)!
                self.value = getFinalResult(decimal: result)
            case .divide:
                if self.value == "0" {
                    self.value = "Error"
                } else {
                    let result = Double(self.firstNumber)! / Double(self.value)!
                    self.value = getFinalResult(decimal: result)
                }
            default:
                break
            }
        case .decimal:
            self.value += "."
            self.isDecimal = true
        case .minus:
            self.value = String(Int(self.value)! * -1)
        case .percent:
            self.value = String(Double(self.value)!/100.0)
        case .clear:
            self.isDecimal = false
            self.value = "0"
            self.firstNumber = "0"
            self.currentOperator = .none
        default:
            let number = item.rawValue
            if self.value == "0" {
                self.value = number
            } else {
                self.value += number
            }
        }
    }
}
