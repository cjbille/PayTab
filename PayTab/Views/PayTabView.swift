import SwiftUI

struct PayTabView: View {
    @State private var payTabViewModel = PayTabViewModel()
    
    var body: some View {
        HStack {
            Text("PayTab").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }
        .padding()
        
        VStack(alignment: .leading) {
            LabeledContent {
                TextField("Enter Total", value: $payTabViewModel.totalAmount, format: .number)
                    .keyboardType(.decimalPad)
            } label: {
                Text("Total:")
            }
            .padding()
            HStack {
                Text("Tip:")
                Text("\(String(format: "%.0f", payTabViewModel.tipAmount))%")
            }
            .padding()
            Slider(value: $payTabViewModel.tipAmount, in: 0...50)
                .padding()
 
        }
        .padding()
        .textFieldStyle(.roundedBorder)
        Button("Total With Tip", systemImage: "arrow.up") {
            payTabViewModel.totalAmountWithTip = payTabViewModel.calculateTotalwithTip()
            payTabViewModel.renderTotalAmountWithTip = true
        }
        if payTabViewModel.renderTotalAmountWithTip {
            Text("\(String(format: "%.2f", payTabViewModel.totalAmountWithTip))")
                .padding()
        } else {
            Text("")
                .padding()
        }
        if payTabViewModel.renderTotalAmountWithTip {
            Button("Clear", systemImage: "clear") {
                payTabViewModel.totalAmount = 0.0
                payTabViewModel.tipAmount = 0.0
                payTabViewModel.totalAmountWithTip = 0
                payTabViewModel.renderTotalAmountWithTip = false
            }
        }
        Spacer()
    }
}

#Preview {
    PayTabView()
}
