//
//  ContentView.swift
//  Calculator
//
//  Created by Steven Wijaya on 11.02.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var result = CalculationModel()
    
    var body: some View {
        ZStack {
            Color(red: 0.945, green: 0.953, blue: 0.965, opacity: 1)
                .ignoresSafeArea()
            VStack (alignment: .leading, spacing: 0) {
                TitleView()
                    .padding(.bottom, 24)
                DisplayView()
                    .environmentObject(result)
                    .padding(.bottom, 25)
                ButtonView()
                    .environmentObject(result)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 8 Plus")
        ContentView()
            .previewDevice("iPhone 13 mini")

    }
}
