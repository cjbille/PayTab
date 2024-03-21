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
            LabeledContent {
                TextField("Enter total", value: $payTabViewModel.totalAmount, format: .number)
                    .keyboardType(.decimalPad)
            } label: {
                Text("Total:")
            }
            .padding()
            LabeledContent {
                TextField("Enter tip", value: $payTabViewModel.tipAmount, format: .percent)
                    .keyboardType(.decimalPad)
            } label: {
                Text("Tip:")
            }
            .padding()
        }
        .padding()
        .textFieldStyle(.roundedBorder)
        Spacer()
    }
}

#Preview {
    PayTabView()
}
