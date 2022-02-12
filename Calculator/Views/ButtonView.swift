//
//  ButtonView.swift
//  Calculator
//
//  Created by Steven Wijaya on 12.02.2022.
//

import SwiftUI




struct textView: View {
    var textButton : String
    
    private func getFontSize(textButton : String) -> CGFloat {
        if textButton == "÷" {
            return 43
        } else if textButton == "-" {
            return 45
        } else {
            return 29
        }
    }
    
    private func isOperator(textButton : String) -> Bool {
        if textButton == "÷" || textButton == "X" || textButton == "-" || textButton == "+" || textButton == "="{
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        Text(textButton)
            .font(Font.custom("Montserrat-Bold", size: getFontSize(textButton: textButton)))
            .fontWeight(.bold)
            .foregroundColor(isOperator(textButton: textButton) ? .white : Color(red: 0.228, green: 0.306, blue: 0.538))
            .frame(width: textButton == "0" ? 176 : 80, height: 80)
            .background(isOperator(textButton: textButton) ? Color(red: 0.227, green: 0.306, blue: 0.537, opacity: 1) : Color(red: 0.945, green: 0.953, blue: 0.965, opacity: 1))
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}


struct ButtonView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack (spacing: 16) {
                Button {
                    //
                } label: {
                    textView(textButton: "AC")
                }
                Button {
                    //
                } label: {
                    textView(textButton: "+/-")
                }
                Button {
                    //
                } label: {
                    textView(textButton: "%")
                }
                Button {
                    //
                } label: {
                    textView(textButton: "÷")
                }
            }
            HStack (spacing: 16) {
                Button {
                    //
                } label: {
                    textView(textButton: "7")
                }
                Button {
                    //
                } label: {
                    textView(textButton: "8")
                }
                Button {
                    //
                } label: {
                    textView(textButton: "9")
                }
                Button {
                    //
                } label: {
                    textView(textButton: "X")
                }
            }
            HStack (spacing: 16) {
                Button {
                    //
                } label: {
                    textView(textButton: "4")
                }
                Button {
                    //
                } label: {
                    textView(textButton: "3")
                }
                Button {
                    //
                } label: {
                    textView(textButton: "2")
                }
                Button {
                    //
                } label: {
                    textView(textButton: "-")
                }
            }
            HStack (spacing: 16) {
                Button {
                    //
                } label: {
                    textView(textButton: "1")
                }
                Button {
                    //
                } label: {
                    textView(textButton: "2")
                }
                Button {
                    //
                } label: {
                    textView(textButton: "3")
                }
                Button {
                    //
                } label: {
                    textView(textButton: "+")
                }
            }
            HStack (spacing: 16) {
                Button {
                    //
                } label: {
                    textView(textButton: "0")
                }
                Button {
                    //
                } label: {
                    textView(textButton: ",")
                }
                Button {
                    //
                } label: {
                    textView(textButton: "=")
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
