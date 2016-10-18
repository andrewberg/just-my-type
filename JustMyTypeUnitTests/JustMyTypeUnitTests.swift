//
//  JustMyTypeUnitTests.swift
//  JustMyTypeUnitTests
//
//  Created by Asa Jenkins on 10/18/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

import XCTest
@testable import JustMyType


class JustMyTypeUnitTests: XCTestCase {
    let xy = TypingTest()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        xy = storyboard.instantiateInitialViewController() as! ViewController
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Unit test written by Asa Jenkins and Jorge Gonzalez to test isCorrect Function
    func testIsCorrect() {
        xy.cur_word = "Airplane"
        XCTAssert(xy.isCorrect(str: "Airplane"))
    }
    
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}
