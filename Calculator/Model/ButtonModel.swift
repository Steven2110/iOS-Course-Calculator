//
//  ButtonValue.swift
//  Calculator
//
//  Created by Steven Wijaya on 12.02.2022.
//

import Foundation

enum ButtonValue : String {
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case clear = "AC"
    case minus = "+/-"
    case percent = "%"
    case divide = "÷"
    case multiply = "X"
    case subtract = "-"
    case add = "+"
    case decimal = ","
    case equal = "="
}

enum Operation {
    case add, subtract, multiply, divide, none
}

class CalculatorCalculation: ObservableObject {
    @Published var firstNumber = "0"
    @Published var value = "0"
    var currentOperator: Operation = .none
    
    @Published var isDecimal: Bool = false
    
    func getFinalResult(decimal: Double) -> String {
        let decimalInString = String(decimal)
        let decArr = decimalInString.components(separatedBy: ".")
        let len = 10 - Double(decArr[0].count)
        let result = round(decimal * pow(10, len))/pow(10, len) //To fix error like 0.1+0.2 = 0.30000000004
        if (floor(result) == result) {
            self.isDecimal = false
            return String(Int(result))
        } else {
            self.isDecimal = true
            return String(result)
        }
    }
    
    func receiveInput(item: ButtonValue) {
        switch item {
        case .add, .subtract, .multiply, .divide, .equal:
            if item == .add {
                self.firstNumber = self.value
                self.currentOperator = .add
            } else if item == .subtract {
                self.firstNumber = self.value
                self.currentOperator = .subtract
            } else if item == .multiply {
                self.firstNumber = self.value
                self.currentOperator = .multiply
            } else if item == .divide {
                self.firstNumber = self.value
                self.currentOperator = .divide
            } else if item == .equal {
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
                    let result = Double(self.firstNumber)! / Double(self.value)!
                    self.value = getFinalResult(decimal: result)
                default:
                    break
                }
            }
            if item != .equal {
                self.value = "0"
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
