import XCTest
@testable import PayTab

final class PayTabViewModelTest: XCTestCase {
    
    func testCalculateTotalwithTip() {
        let payTabViewModel = PayTabViewModel()
        payTabViewModel.totalAmount = 10.0
        payTabViewModel.tipAmount = 20.0
        let totalWithTipActual = payTabViewModel.calculateTotalwithTip()
        let totalWithTipExpected = 12.0
        XCTAssertEqual(totalWithTipActual, totalWithTipExpected)
    }
}
