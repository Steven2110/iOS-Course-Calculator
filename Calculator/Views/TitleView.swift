//
//  TitleView.swift
//  Calculator
//
//  Created by Steven Wijaya on 15.02.2022.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        Text("Calculator")
            .fontWeight(.medium)
            .font(Font.custom("Museo 700", size: 28))
            .foregroundColor(Color(red: 0.216, green: 0.227, blue: 0.216, opacity: 1))
            .frame(width: 140, height: 34, alignment: .leading)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
