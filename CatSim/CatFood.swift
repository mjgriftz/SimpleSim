//
//  CatFood.swift
//  CatSim
//
//  Created by Marcus Griffiths on 3/15/16.
//  Copyright © 2016 Griffy. All rights reserved.
//

import Foundation
import SpriteKit

// The 'viewable' protocol defines objects that are visible to the cat
protocol viewable {
    func getLocation() -> CGPoint
    func getDistance(theCat: GameCat) -> CGFloat
    func getDistanceVector(theCat: GameCat) -> CGSize
}

class CatFood : SKSpriteNode, viewable{
    
    var isActive: Bool = false // flag for scene to remove from viewable items list
    init(image: String) {
        super.init(texture: nil, color: UIColor.whiteColor(), size: CGSize(width: 128.0, height: 128.0))
        self.texture = SKTexture(imageNamed: image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func removeFood() {
        self.removeFromParent()
        isActive = false
    }
    
    func getLocation() -> CGPoint{
        return self.position
    }
    
    // Returns absolute distance from cat as a scalar
    func getDistance(theCat: GameCat) -> CGFloat{
        let xDist = theCat.position.x - self.position.x
        let yDist = theCat.position.y - self.position.y
        return sqrt(xDist * xDist + yDist * yDist)
    }
    
    // Returns X and Y vector differences from cat as a 2D vector
    func getDistanceVector(theCat: GameCat) -> CGSize {
        let xDist = theCat.position.x - self.position.x
        let yDist = theCat.position.y - self.position.y
        return CGSize(width: xDist, height: yDist)
    }
}