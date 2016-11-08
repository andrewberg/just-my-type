//
//  BasketBallScene.swift
//  JustMyType
//
//  Created by Bradley Close on 11/8/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

import Foundation
import SpriteKit

class BasketBallScene: SKScene{
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
        
    }//required init
    var viewSize:CGSize!
    var Basketball:SKSpriteNode!
    
    
    override init(size:CGSize){
        super.init(size: size)
        viewSize = size
        
        let BG = SKSpriteNode(imageNamed: "BG")
        BG.position = CGPoint(x: viewSize.width/2, y: viewSize.height/2)
        self.addChild(BG)
        
        Basketball = SKSpriteNode(imageNamed: "Basketball")
        Basketball.position = CGPoint(x:viewSize.width/2, y:viewSize.height/8)
        self.addChild(Basketball)
        
        
        
        
        
    }//init function
    
}//class end
