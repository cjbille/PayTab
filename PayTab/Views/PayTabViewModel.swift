import Foundation

@Observable
class PayTabViewModel {
    var totalAmount = 0.0
    var tipAmount = 0.0
    var totalAmountWithTip = 0.0
    var renderTotalAmountWithTip = false
    
    func calculateTotalwithTip() -> Double {
        let roundTipAmount = round(tipAmount)
        let tipPercentage = roundTipAmount / 100
        print("tip percentage is \(roundTipAmount)")
        return totalAmount * (1 + tipPercentage)
    }
}
