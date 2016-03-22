import XCTest

class ServerTest : XCTestCase {
  var allTests : [(String, () throws -> Void)] {
    return [
      ("testAsserts", testAsserts)
    ]
  }

  func testAsserts() {
    XCTAssertEqual(1, 1, "Message shown when assert fails")
    XCTAssertNil(foo, "Message shown when assert fails")
    XCTFail("Message always shows since this always fails")
          // Other Asserts can be used as well
  }
}
