//
//  GameScene.swift
//  CatSim
//
//  Created by Marcus Griffiths on 3/15/16.
//  Copyright (c) 2016 Griffy. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var visibleItems: [viewable] = [viewable]()
    var newFood: CatFood?
    let CAT_LAYER:CGFloat = 5.0
    let FOOD_LAYER: CGFloat = 3.0
    var currentCat: GameCat = GameCat(imageSet: "CatSprite")
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        self.currentCat.position = CGPoint(x: self.size.width / 2.0 , y: self.size.height / 2.0) // center of scene
        self.currentCat.zPosition = CAT_LAYER
        self.addChild(self.currentCat)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        // start food item
        self.newFood = CatFood(image: "theFood")
        self.newFood!.position = (touches.first?.locationInNode(self))!
        self.addChild(self.newFood!)
        // end food item
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // start food item
        self.newFood!.position = (touches.first?.locationInNode(self))!
        // end food item
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // start food item
        self.newFood?.isActive = true
        self.visibleItems.append(self.newFood!)
        // end food item
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        currentCat.update()
    }
}
