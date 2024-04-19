import SwiftUI

struct PayTabView: View {
    @State private var payTabViewModel = PayTabViewModel()
    @FocusState private var totalIsFocused: Bool
    
    var body: some View {
        ScrollView {
            HStack {
                Text("PayTab").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            .padding()
            
            VStack(alignment: .leading) {
                LabeledContent {
                    TextField("Enter Total", value: $payTabViewModel.totalAmount, format: .currency(code: "USD"))
                        .keyboardType(.decimalPad)
                        .focused($totalIsFocused)
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                Button("Done") {
                                    totalIsFocused = false
                                }
                            }
                        }
                } label: {
                    Text("Total:")
                }
                .padding()
                HStack {
                    Text("Tip:")
                    Text("\(String(format: "%.0f", payTabViewModel.tipAmount))%")
                }
                .padding()
                Slider(value: $payTabViewModel.tipAmount, in: 0...100, step: 5)
                    .padding()
            }
            .padding()
            .textFieldStyle(.roundedBorder)
            
            Button("Calculate Total", systemImage: "arrow.up") {
                payTabViewModel.totalAmountWithTip = payTabViewModel.calculateTotalwithTip()
                payTabViewModel.renderTotalAmountWithTip = true
                totalIsFocused = false
            }
            .buttonStyle(.bordered)
            
            if payTabViewModel.renderTotalAmountWithTip {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Total With Tip:")
                        if payTabViewModel.totalAmountWithTip == 0.00 {
                            Text("$\(String(format: "%.0f", payTabViewModel.totalAmountWithTip))")
                                .padding()
                        } else {
                            Text("$\(String(format: "%.2f", payTabViewModel.totalAmountWithTip))")
                                .padding()
                        }
                    }
                }
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
                .buttonStyle(.bordered)
            }
            Spacer()
        }
    }
}

#Preview {
    PayTabView()
}
