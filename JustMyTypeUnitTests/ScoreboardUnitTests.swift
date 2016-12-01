//
//  ScoreboardUnitTests.swift
//  JustMyType
//
//  Created by Andrew on 11/30/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

import XCTest
@testable import JustMyType

class ScoreboardUnitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Andrew Berg
    func testUpdateAverage() {
        let oldAvg = Highscores.sharedInstance.ttGetAverage()
        
        Highscores.sharedInstance.ttUpdateAverage(score: 50)
        let newAvg = Highscores.sharedInstance.ttGetAverage()
        Highscores.sharedInstance.ttSetAverage(val: oldAvg)
        XCTAssert(newAvg != oldAvg)
    }

    // Andrew Berg
    func testResetAverage() {
        let oldAvg = Highscores.sharedInstance.ttGetAverage()
        
        Highscores.sharedInstance.ttResetAverage()
        let newAvg = Highscores.sharedInstance.ttGetAverage()
        Highscores.sharedInstance.ttSetAverage(val: oldAvg)
        XCTAssert(newAvg == 0)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
