//
//  Choose_My_PlantTests.swift
//  Choose My PlantTests
//
//  Created by rabei mghrabi on 26/08/2020.
//  Copyright © 2020 Katie Jones. All rights reserved.
//

import XCTest
@testable import Choose_My_Plant

class Choose_My_PlantTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testisPasswordValid(){
        XCTAssert(Utilities.isPasswordValid(password:"aA1$qwerty"))
    }


}
