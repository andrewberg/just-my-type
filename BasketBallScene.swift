//
//  BasketBallScene.swift
//  JustMyType
//  Richard Nelson
//  Created by Bradley Close on 11/8/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

import Foundation
import SpriteKit

class BasketBallScene: SKScene {
    override func didMove(to view: SKView) {
        /* Setup your scene here */
        let viewSize:CGSize = view.bounds.size
        let BG = SKSpriteNode(imageNamed: "BG")
        BG.position = CGPoint(x:viewSize.width/2, y:viewSize.height/2)
        self.addChild(BG)
        
        let myLabel = SKLabelNode(fontNamed: "Chalkduster")
        myLabel.text = "Basketball Game"
        myLabel.fontSize = 35
        myLabel.position = CGPoint(x: viewSize.width/2, y: viewSize.height * (2/3))
        self.addChild(myLabel)
        
        let playBtn = SKSpriteNode(imageNamed: "playBtn")
        playBtn.position = CGPoint(x: viewSize.width/2, y: viewSize.height/2)
        self.addChild(playBtn)
        playBtn.name = "playBtn"

        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
           let location = touch.location(in: self)
            let _node:SKNode = self.atPoint(location)
            
            if(_node.name=="playBtn"){
            
            let scene = GamePlayScene(size: self.size)
            self.view?.presentScene(scene)
            }
                    }
    }
    
}
