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
                TextField("Enter Total", value: $payTabViewModel.totalAmount, format: .number)
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
            Button("Total With Tip", systemImage: "arrow.up") {
                payTabViewModel.totalAmountWithTip = payTabViewModel.calculateTotalwithTip()
                payTabViewModel.renderTotalAmountWithTip = true
            }
            .padding()
            if payTabViewModel.renderTotalAmountWithTip {
                Text("\(String(format: "%.2f", payTabViewModel.totalAmountWithTip))")
                    .padding()
            } else {
                Text("")
                    .padding()
            }
            if payTabViewModel.renderTotalAmountWithTip {
                Button("Clear", systemImage: "arrow.down") {
                    payTabViewModel.totalAmount = 0.0
                    payTabViewModel.tipAmount = 0.0
                    payTabViewModel.totalAmountWithTip = 0
                    payTabViewModel.renderTotalAmountWithTip = false
                }
            }
        }
        .padding()
        .textFieldStyle(.roundedBorder)
        Spacer()
    }
}

#Preview {
    PayTabView()
}
