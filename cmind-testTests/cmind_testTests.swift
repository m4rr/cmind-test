//
//  cmind_testTests.swift
//  cmind-testTests
//
//  Created by Marat S. on 22/12/15.
//  Copyright © 2015 m4rr. All rights reserved.
//

import XCTest

class cmind_testTests: XCTestCase {

  let gf = GroupingFormatter()

  override func setUp() {
    super.setUp()

  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  func testWriteOut() {
    let test: [String: Double] = [
      "one 2, one 1": 21,
      "two 1s, one 2, one 1": 1121,
      "three 3s": 333,
    ]

    for (key, value) in test {
      let result = gf.gg(value)
      XCTAssert(key == result, "writeOut() doesn't work")
    }
  }

  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measureBlock {
      // Put the code you want to measure the time of here.
    }
  }

}
