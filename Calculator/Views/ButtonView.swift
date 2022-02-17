//
//  ButtonView.swift
//  Calculator
//
//  Created by Steven Wijaya on 12.02.2022.
//

import SwiftUI

struct ButtonView: View {
    private let buttonSpacing : CGFloat = 16
    private let buttons : [[ButtonValue]] = [
        [.clear, .minus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    @EnvironmentObject var result : CalculatorCalculation
    
    var body: some View {
        VStack(alignment: .leading, spacing: self.buttonSpacing) {
            ForEach(buttons, id: \.self) { row in
                HStack(spacing: self.buttonSpacing) {
                    ForEach(row, id: \.self) { button in
                        Button {
                            result.receiveInput(item: button)
                        } label: {
                            ButtonTextView(textButton: button)
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
            .environmentObject(CalculatorCalculation())
    }
}
