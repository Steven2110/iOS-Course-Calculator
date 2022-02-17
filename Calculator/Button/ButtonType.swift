//
//  ButtonType.swift
//  Calculator
//
//  Created by Steven Wijaya on 17.02.2022.
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
