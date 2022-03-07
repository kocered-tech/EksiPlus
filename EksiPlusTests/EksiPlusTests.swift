//
//  EksiPlusTests.swift
//  EksiPlusTests
//
//  Created by Erdem Koçer on 5.03.2022.
//

import XCTest
@testable import EksiPlus

class EksiPlusTests: XCTestCase {

    var sut: EksiPlusApp!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = EksiPlusApp()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testScrollIndexIsBetweenIndicatedValues() {
        // Given
        let topicCount = 15
        let refreshBefore = 5

        let index = TopicsView().getScrollIndex(topicCount, refreshBefore: refreshBefore)

        XCTAssertEqual(10, index)
    }

}
