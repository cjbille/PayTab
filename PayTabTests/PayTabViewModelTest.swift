import XCTest
@testable import PayTab

final class PayTabViewModelTest: XCTestCase {
    
    func testCalculateTotalwithTipShouldReturnTotalWithTip() {
        let payTabViewModel = PayTabViewModel()
        payTabViewModel.totalAmount = 10.0
        payTabViewModel.tipAmount = 20.0
        let totalWithTipActual = payTabViewModel.calculateTotalwithTip()
        let totalWithTipExpected = 12.0
        XCTAssertEqual(totalWithTipActual, totalWithTipExpected)
    }
    
    func testTipShouldReturnAmountToTip() {
        let payTabViewModel = PayTabViewModel()
        payTabViewModel.totalAmount = 10.0
        payTabViewModel.totalAmountWithTip = 12.0
        let amountToTipActual = payTabViewModel.tip()
        let amountToTipExpected = 2.0
        XCTAssertEqual(amountToTipActual, amountToTipExpected)
    }	
}
