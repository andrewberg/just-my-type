//
//  LeaderboardUnitTests.swift
//  JustMyType
//
//  Created by Andrew on 11/24/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

import XCTest
@testable import JustMyType

class LeaderboardUnitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Andrew Berg
    func testGetUsername() {
        let x = Leaderboard.getUserName()
        XCTAssert(x != "")
    }
    
    // Andrew Berg
    func testSetUsername() {
        let x = Leaderboard.getUserName()
        let y = "bob321"
        Leaderboard.setUserName(username: y)
        let z = Leaderboard.getUserName()
        Leaderboard.setUserName(username: x)
        XCTAssert(y == z)
    }
    
    // Andrew Berg
    func testGetModeDefault() {
        XCTAssert(Leaderboard.sharedInstance.getMode(val: "fdsafdsa") == GameMode.typingtest.rawValue)
    }
    
    // Andrew Berg
    func testGetModeCorrect() {
        XCTAssert(Leaderboard.sharedInstance.getMode(val: "bb") == GameMode.basketball.rawValue)
    }
    
    // Andrew Berg
    func testGetListTT() {
        Leaderboard.sharedInstance.getLeaderboard(mode: "tt")
        {(scores: [(name: String, score: Double)]) -> (Void) in
            XCTAssert(scores.count > 0)
        }
    }
    
    // Andrew Berg
    func testGetListBL() {
        Leaderboard.sharedInstance.getLeaderboard(mode: "bl")
        {(scores: [(name: String, score: Double)]) -> (Void) in
            XCTAssert(scores.count > 0)
        }
    }
    
    // Andrew Berg
    func testGetListBB() {
        Leaderboard.sharedInstance.getLeaderboard(mode: "bb")
        {(scores: [(name: String, score: Double)]) -> (Void) in
            XCTAssert(scores.count > 0)
        }
    }
    
    // Andrew Berg
    func testGetListAG() {
        Leaderboard.sharedInstance.getLeaderboard(mode: "ag")
        {(scores: [(name: String, score: Double)]) -> (Void) in
            XCTAssert(scores.count > 0)
        }
    }
    
    // Andrew Berg
    func testGetListRC() {
        Leaderboard.sharedInstance.getLeaderboard(mode: "rc")
        {(scores: [(name: String, score: Double)]) -> (Void) in
            XCTAssert(scores.count > 0)
        }
    }
    
    // Andrew Berg
    func testResetTT() {
        Leaderboard.sharedInstance.addToArray(val: "tt", name: "bob", score: 40.0)
        Leaderboard.sharedInstance.resetArray(val: "tt")
        XCTAssert(Leaderboard.sharedInstance.ttScores.count == 0)
    }
    
    // Andrew Berg
    func testResetBB() {
        Leaderboard.sharedInstance.addToArray(val: "bb", name: "bob", score: 40.0)
        Leaderboard.sharedInstance.resetArray(val: "bb")
        XCTAssert(Leaderboard.sharedInstance.bbScores.count == 0)
    }
    
    // Andrew Berg
    func testResetBL() {
        Leaderboard.sharedInstance.addToArray(val: "bl", name: "bob", score: 40.0)
        Leaderboard.sharedInstance.resetArray(val: "bl")
        XCTAssert(Leaderboard.sharedInstance.blScores.count == 0)
    }
    
    // Andrew Berg
    func testResetRC() {
        Leaderboard.sharedInstance.addToArray(val: "rc", name: "bob", score: 40.0)
        Leaderboard.sharedInstance.resetArray(val: "rc")
        XCTAssert(Leaderboard.sharedInstance.rcScores.count == 0)
    }
    
    // Andrew Berg
    func testResetAG() {
        Leaderboard.sharedInstance.addToArray(val: "ag", name: "bob", score: 40.0)
        Leaderboard.sharedInstance.resetArray(val: "ag")
        XCTAssert(Leaderboard.sharedInstance.agScores.count == 0)
    }

    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    
}
