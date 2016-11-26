//
//  RacingGame.swift
//  JustMyType
//
//  Created by Lauren Koulias on 11/25/16.
//  Copyright (c) 2016 Lauren Koulias. All rights reserved.
//

import Foundation
import SpriteKit

let carOneName = "carOne"
let carTwoName = "carTwo" // Players car
let carThreeName = "carThree"

// Lauren Koulias
class RacingGame: SKScene {
    
    // Setup
    override func didMove(to view: SKView) {
        super.didMove(to: view)

        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Lets Race!"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
        
        self.addChild(myLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        self.moveCarForward(carName: carTwoName)

    }
    
    public func moveCarForward(carName: String) {
        let car = childNode(withName: carName) as! SKSpriteNode
        let action = SKAction.moveBy(x: 0, y: 150, duration: 1.5)
        car.run(action)
    }
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
    }
    
}
