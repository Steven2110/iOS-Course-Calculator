//
//  ContentView.swift
//  Calculator
//
//  Created by Steven Wijaya on 11.02.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var result = CalculatorCalculation()
    
    var body: some View {
        VStack (alignment: .leading, spacing: 25) {
            VStack (alignment: .leading, spacing: 24) {
                TitleView()
                DisplayView()
                    .environmentObject(result)
            }
            ButtonView()
                .environmentObject(result)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 8 Plus")
    }
}
