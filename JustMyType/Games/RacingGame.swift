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

let backgroundName = "background"

// Lauren Koulias
class RacingGame: SKScene {
    var viewController: RacingGameViewController!
    var timerCarOne: Timer?
    var timerCarThree: Timer?
    
    // Setup
    // Lauren Koulias
    override func didMove(to view: SKView) {
        super.didMove(to: view)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
    }
    
    // Lauren Koulias
    public func startGame() {
        // Shows the start text on the screen
        let background = childNode(withName: backgroundName) as! SKSpriteNode
        let startLabel = SKLabelNode(fontNamed: "IowanOldStyle-Bold")
        startLabel.text = "Start!"
        startLabel.fontSize = 60
        startLabel.zPosition = 1
        startLabel.position = CGPoint(x: background.position.x * (1/2), y: background.position.y * (1/2))
        self.addChild(startLabel)
        startLabel.run(SKAction.fadeOut(withDuration: 1))
        
        // Set random timer to move each car forward
        self.timerCarOne = Timer.scheduledTimer(timeInterval: TimeInterval(self.randRange(lower: 1, upper: 2)), target: self, selector: #selector(RacingGame.moveCarOneForward), userInfo: nil, repeats: true)
        self.timerCarThree = Timer.scheduledTimer(timeInterval: TimeInterval(self.randRange(lower: 1, upper: 2)), target: self, selector: #selector(RacingGame.moveCarThreeForward), userInfo: nil, repeats: true)
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
        
        let background = childNode(withName: backgroundName) as! SKSpriteNode

        // If the node hits the finish line
        // (background.size.width / 2) is used because the car x position starts as negative half the backgrounds x
        if car.position.x + (background.size.width / 2) >= background.size.width - 35 {
            self.stopCarsMovingForward()
            viewController.gameOverAndWonBy(carName: carName)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
    }
    
}
