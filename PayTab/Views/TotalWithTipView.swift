import SwiftUI

struct TotalWithTipView: View {
    let tipFormat: String
    let amountToTip: Double
    let totalAmountWithTip: Double
    
    var body: some View {
        HStack {
            Text("Tip Amount:")
            Text("$\(String(format: tipFormat, amountToTip))")
                .padding()
        }
        HStack {
            Text("Total With Tip:")
            Text("$\(String(format: tipFormat, totalAmountWithTip))")
                .padding()
        }
    }
    
    init(_ tipFormat: String, _ amountToTip: Double, _ totalAmountWithTip: Double) {
        self.tipFormat = tipFormat
        self.amountToTip = amountToTip
        self.totalAmountWithTip = totalAmountWithTip
    }
}

#Preview {
    TotalWithTipView("0.2f", 0.0, 0.0)
}
