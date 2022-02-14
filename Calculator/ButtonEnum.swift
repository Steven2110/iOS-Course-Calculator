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

class CalculatorResult: ObservableObject {
    @Published var value = "0"
    
    func receiveInput(item: ButtonValue) {
        switch item {
        case .add, .subtract, .multiply, .divide, .equal:
            break
        case .percent, .decimal, .minus:
            break
        case .clear:
            self.value = "0"
        default:
            let number = item.rawValue
            print(number)
            if self.value == "0" {
                self.value = number
            } else {
                self.value += number
                print("My value: \(self.value)")
            }
        }
    }
}
