//
//  ButtonTextView.swift
//  Calculator
//
//  Created by Steven Wijaya on 17.02.2022.
//

import SwiftUI

struct ButtonTextView: View {
    var textButton : ButtonValue
    private let shadowColor1 = Color(red: 0.216, green: 0.329, blue: 0.667, opacity: 0.1)
    private let shadowColor2 = Color(red: 1, green: 1, blue: 1, opacity: 1)
    
    private func getFontSize(textButton : ButtonValue) -> CGFloat {
        if textButton == .divide {
            return 43
        } else if textButton == .subtract {
            return 45
        } else {
            return 29
        }
    }
    
    private func getButtonBackgroundColor(button: ButtonValue) -> Color {
        if isOperator(textButton: button) {
            return  Color(red: 0.227, green: 0.306, blue: 0.537, opacity: 1)
        } else {
            return  Color(red: 0.945, green: 0.953, blue: 0.965, opacity: 1)
        }
    }
    
    private func isOperator(textButton : ButtonValue) -> Bool {
        let operators: [ButtonValue] = [.add, .multiply, .subtract, .divide, .equal]
        return operators.contains(textButton)
    }
    
    var body: some View {
        Text(textButton.rawValue)
            .font(Font.custom("Montserrat-Bold", size: getFontSize(textButton: textButton)))
            .fontWeight(.bold)
            .foregroundColor(isOperator(textButton: textButton) ? .white : Color(red: 0.228, green: 0.306, blue: 0.538))
            .frame(width: self.getWidth(item: textButton), height: self.getHeight())
            .background(getButtonBackgroundColor(button: textButton))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: shadowColor1, radius: 10, x: 5, y: 5)
            .shadow(color: shadowColor2, radius: 10, x: -5, y: -5)
    }
    private func getWidth(item: ButtonValue) -> CGFloat {
        let width : CGFloat = (UIScreen.main.bounds.width - (3 * 16) - (24 + 22)) / 4
        if item == .zero {
            return width * 2 + 16
        }
        return width
    }
    private func getHeight() -> CGFloat {
        return (UIScreen.main.bounds.height - (4 * 16) - (208 + 64)) / 5
    }
}

struct ButtonTextView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonTextView(textButton: .decimal)
    }
}
