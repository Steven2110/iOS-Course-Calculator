//
//  ButtonTextView.swift
//  Calculator
//
//  Created by Steven Wijaya on 17.02.2022.
//

import SwiftUI

struct ButtonTextView: View {
    var textButton : ButtonValue
    
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
        if textButton == .divide || textButton == .multiply || textButton == .subtract || textButton == .add || textButton == .equal{
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        Text(textButton.rawValue)
            .font(Font.custom("Montserrat-Bold", size: getFontSize(textButton: textButton)))
            .fontWeight(.bold)
            .foregroundColor(isOperator(textButton: textButton) ? .white : Color(red: 0.228, green: 0.306, blue: 0.538))
            .frame(width: textButton == .zero ? 176 : 80, height: 80)
            .background(getButtonBackgroundColor(button: textButton))
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct ButtonTextView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonTextView(textButton: .decimal)
    }
}
