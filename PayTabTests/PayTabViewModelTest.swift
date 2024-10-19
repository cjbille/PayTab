import Testing
@testable import PayTab

struct PayTabViewModelTest {
    
    @Test func testCalculateTotalwithTipShouldReturnTotalWithTip() {
        let payTabViewModel = PayTabViewModel()
        payTabViewModel.totalAmount = 10.0
        payTabViewModel.tipAmount = 20.0
        let totalWithTip = payTabViewModel.calculateTotalwithTip()
        #expect(totalWithTip == 12.0)
    }
    
    @Test func testTipShouldReturnAmountToTip() {
        let payTabViewModel = PayTabViewModel()
        payTabViewModel.totalAmount = 10.0
        payTabViewModel.totalAmountWithTip = 12.0
        let amountToTip = payTabViewModel.tip()
        #expect(amountToTip == 2.0)
    }
}
