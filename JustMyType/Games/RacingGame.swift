//
//  RacingGame.swift
//  JustMyType
//
//  Created by Lauren Koulias on 11/25/16.
//  Copyright (c) 2016 Lauren Koulias. All rights reserved.
//

import Foundation
import SpriteKit

// Names of the spriteser
let carOneName = "Computer 1"
let carTwoName = "Player 1"
let carThreeName = "Computer 2"

// Lauren Koulias
class RacingGame: SKScene {
    var viewController: RacingGameViewController!
    var timerCarOne: Timer?
    var timerCarThree: Timer?
    
    // Setup
    // Lauren Koulias
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        // Set random timer to move each car forward
        self.timerCarOne = Timer.scheduledTimer(timeInterval: TimeInterval(self.randRange(lower: 1, upper: 3)), target: self, selector: #selector(RacingGame.moveCarOneForward), userInfo: nil, repeats: true)
        self.timerCarThree = Timer.scheduledTimer(timeInterval: TimeInterval(self.randRange(lower: 1, upper: 3)), target: self, selector: #selector(RacingGame.moveCarThreeForward), userInfo: nil, repeats: true)

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
    }
    
    /*
        Get random number from range
        Credits: http://stackoverflow.com/a/24059196
    */
    func randRange (lower: UInt32 , upper: UInt32) -> UInt32 {
        return lower + arc4random_uniform(upper - lower + 1)
    }
    
    // Lauren Koulias
    func moveCarOneForward() {
        self.moveCarForward(carName: carOneName)
    }
    
    // Lauren Koulias
    public func moveCarTwoForward() {
        self.moveCarForward(carName: carTwoName)
    }
    
    // Lauren Koulias
    func moveCarThreeForward() {
        self.moveCarForward(carName: carThreeName)
    }
    
    func stopCarsMovingForward() {
        self.timerCarOne?.invalidate()
        self.timerCarThree?.invalidate()
    }
    
    // Lauren Koulias
    func moveCarForward(carName: String) {
        let car = childNode(withName: carName) as! SKSpriteNode
        let action = SKAction.moveBy(x: 60, y: 0, duration: 1.5)
        car.run(action)
        
        // If the node goes off the screen the games over
        if !car.intersects(car.parent!) {
            self.stopCarsMovingForward()
            viewController.gameOverAndWonBy(carName: carName)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
    }
    
}
