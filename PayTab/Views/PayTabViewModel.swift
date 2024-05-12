import Foundation

@Observable
class PayTabViewModel {
    var totalAmount = 0.0
    var tipAmount = 0.0
    var totalAmountWithTip = 0.0
    var amountToTip = 0.0
    var renderTotalAmountWithTip = false
    private var tipPercentage: Double { round(tipAmount) / 100 }
    
    func calculateTotalwithTip() -> Double {
        totalAmount * (1 + tipPercentage)
    }
    
    func tip() -> Double {
        totalAmountWithTip - totalAmount
    }
}
