import XCTest
@testable import CustomAlbum

final class CustomAlbumTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CustomAlbum().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
