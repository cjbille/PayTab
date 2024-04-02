import Foundation

@Observable
class PayTabViewModel {
    var totalAmount = 0.0
    var tipAmount = 0.0
    var totalAmountWithTip = 0.0
    var renderTotalAmountWithTip = false
    
    func calculateTotalwithTip() -> Double {
        return totalAmount * (1 + tipAmount)
    }
}
