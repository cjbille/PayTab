import SwiftUI

struct PayTabView: View {
    @State private var payTabViewModel = PayTabViewModel()
    @FocusState private var totalIsFocused: Bool
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        ScrollView {
            HStack {
                Text("PayTab").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            .padding()
            
            VStack(alignment: .leading) {
                LabeledContent {
                    TextField("Enter Total", value: $payTabViewModel.totalAmount, format: .number)
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
                payTabViewModel.amountToTip = payTabViewModel.tip()
                payTabViewModel.renderTotalAmountWithTip = true
                totalIsFocused = false
            }
            .buttonStyle(.bordered)
            .foregroundColor(colorScheme == .dark ? .white : .blue)
            
            if payTabViewModel.renderTotalAmountWithTip {
                VStack(alignment: .leading) {
                    if payTabViewModel.totalAmountWithTip == 0.00 {
                        TotalWithTipView("%.0f", payTabViewModel.amountToTip, payTabViewModel.totalAmountWithTip)
                    } else {
                        TotalWithTipView("%.2f", payTabViewModel.amountToTip, payTabViewModel.totalAmountWithTip)
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
                    totalIsFocused = false
                }
                .buttonStyle(.bordered)
                .foregroundStyle(.red)
            }
            Spacer()
        }
        .background(Gradient(colors: [.themeTop, .themeBottom]))
    }
}

#Preview {
    PayTabView()
}
