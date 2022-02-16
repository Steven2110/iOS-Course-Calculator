//
//  ButtonView.swift
//  Calculator
//
//  Created by Steven Wijaya on 12.02.2022.
//

import SwiftUI

struct textView: View {
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
            .background(isOperator(textButton: textButton) ? Color(red: 0.227, green: 0.306, blue: 0.537, opacity: 1) : Color(red: 0.945, green: 0.953, blue: 0.965, opacity: 1))
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}


struct ButtonView: View {
    let buttons : [[ButtonValue]] = [
        [.clear, .minus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    @EnvironmentObject var result : CalculatorCalculation
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(buttons, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { button in
                        Button {
                            result.receiveInput(item: button)
                        } label: {
                            textView(textButton: button)
                        }
                    }
                }
            }
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
