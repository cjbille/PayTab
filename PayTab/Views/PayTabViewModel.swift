import Foundation

@Observable
class PayTabViewModel {
    var totalAmount = 0.0
    var tipAmount = 0.0
    
    
    func calculateTotalwithTip() -> Double {
        return totalAmount * (1 + tipAmount)
    }
}
