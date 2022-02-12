//
//  ContentView.swift
//  Calculator
//
//  Created by Steven Wijaya on 11.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var result = "2345"
    
    var body: some View {
        VStack (alignment: .leading, spacing: 25) {
            VStack (alignment: .leading, spacing: 24) {
                HStack(spacing: 24) {
                    Text("Calculator")
                        .fontWeight(.medium)
                        .font(Font.custom("Museo 700", size: 28))
                        .foregroundColor(Color(red: 0.216, green: 0.227, blue: 0.216, opacity: 1))
                        .frame(width: 140, height: 34, alignment: .leading)
                }
                DisplayView(result: result)
            }
            ButtonView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 8 Plus")
    }
}
