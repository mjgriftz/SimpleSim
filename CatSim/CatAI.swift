//
//  CatAI.swift
//  CatSim
//
//  Created by Marcus Griffiths on 3/15/16.
//  Copyright © 2016 Griffy. All rights reserved.
//

import Foundation
import SpriteKit

class CatAI {
    
    let VISION_RANGE: CGFloat = 300.0
    let MAX_HUNGER: Int16 = 20
    let MAX_BORED: Int16 = 20
    let MAX_TIRED: Int16 = 20
    let hostCat: GameCat?
    private var catHunger: Int16 = 5
    private var catBored: Int16 = 5
    private var catTired: Int16 = 5
    var onTheMind: viewable?
    
    init(hostCat: GameCat) {
        self.hostCat = hostCat
    }
    
    // updates every frame
    private func evaluateMood() {
        
    }
    // updates every frame - detects the closest visible object and memorizes it
    private func evaluateEnvironment() {
        let currentlyVisible = hostCat?.scene as! GameScene
        var shortDistance = self.VISION_RANGE
        var closestThing: viewable? = nil
        for thing in currentlyVisible.visibleItems {
            if thing.getDistance(self.hostCat!) < shortDistance {
                shortDistance = thing.getDistance(self.hostCat!)
                closestThing = thing
            }
            
        }
        if closestThing != nil { memorize(closestThing!) }
        
    }
    
    func memorize(thing: viewable) {
        self.onTheMind = thing
    }
    
    // Per-frame movement towards memorized object
    private func moveTowards() {
        self.hostCat?.position.x += -(onTheMind!.getDistanceVector(hostCat!).width / (onTheMind?.getDistance(hostCat!))!)
        self.hostCat?.position.y += -(onTheMind!.getDistanceVector(hostCat!).height / (onTheMind?.getDistance(hostCat!))!)
        
    }
    
    // Safe calls to alter needs states
    func induceBoredom() { if self.catBored < self.MAX_BORED { self.catBored += 1}}
    func induceHunger() { if self.catHunger < self.MAX_HUNGER { self.catHunger += 1 }}
    func induceTired() { if self.catTired < self.MAX_TIRED { self.catTired += 1}}
    func reduceBoredom() { if self.catBored > 0 { self.catBored -= 1 }}
    func reduceTired() { if self.catTired > 0 { self.catTired -= 1 }}
    func reduceHunger() { if self.catHunger > 0 { self.catHunger -= 1 }}
    
    func update() {
        self.evaluateMood()
        self.evaluateEnvironment()
        if onTheMind != nil { self.moveTowards() }
    }
}