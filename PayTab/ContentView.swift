//
//  ContentView.swift
//  PayTab
//
//  Created by Christopher Bille on 1/24/24.
//

import SwiftUI

struct ContentView: View {
    @State private var tipAmount = 0.0
    
    var body: some View {
        HStack {
            Text("PayTab").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }
        .padding()
        
        VStack {
            Text("Enter tip amount")
            TextField("Enter tip amount", value: $tipAmount, format: .number)
                .border(.secondary)
                .padding()
                .keyboardType(.decimalPad)
        }
        Spacer()
    }
}

#Preview {
    ContentView()
}
