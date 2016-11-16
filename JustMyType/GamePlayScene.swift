//
//  GamePlayScene.swift
//  JustMyType
//
//  Created by Bradley Close on 11/9/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

import Foundation
import SpriteKit

class GamePlayScene: SKScene{
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
        
        
    }
    
    var viewSize:CGSize!
    var Basketball:SKSpriteNode!
    var type = TypingTest()
    
    override init(size: CGSize){
        super.init(size: size)
        viewSize=size
        let BG = SKSpriteNode(imageNamed: "BG")
        BG.position = CGPoint(x: viewSize.width/2, y:viewSize.height/2)
        self.addChild(BG)
        
        Basketball = SKSpriteNode(imageNamed: "Basketball")
        Basketball.position = CGPoint(x: viewSize.width/2, y: viewSize.height/6.5)
        self.addChild(Basketball)
        
        
        let moveBall = SKAction.moveTo(y:350, duration: 2)
        Basketball.run(moveBall)
        
        
        
    }
    
    
    
    
}
