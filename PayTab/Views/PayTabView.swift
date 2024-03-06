//
//  ContentView.swift
//  PayTab
//
//  Created by Christopher Bille on 1/24/24.
//

import SwiftUI

struct PayTabView: View {
    @State private var payTabViewModel = PayTabViewModel()
    
    var body: some View {
        HStack {
            Text("PayTab").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }
        .padding()
        
        VStack {
            Text("Total")
            TextField("Enter total", value: $payTabViewModel.totalAmount, format: .number)
                .border(.secondary)
                .padding()
                .keyboardType(.decimalPad)
            Text("Tip")
            TextField("Enter tip", value: $payTabViewModel.tipAmount, format: .number)
                .border(.secondary)
                .padding()
                .keyboardType(.decimalPad)
        }
        Spacer()
    }
}

#Preview {
    PayTabView()
}
