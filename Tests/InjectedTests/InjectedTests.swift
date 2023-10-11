import XCTest
@testable import Injected

final class InjectedTests: XCTestCase {
   
    func test_context() {
        XCTAssertEqual(
            InjectedValues.Context(),
            .test
        )
    }
}
