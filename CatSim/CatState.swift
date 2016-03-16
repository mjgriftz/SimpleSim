//
//  CatState.swift
//  CatSim
//
//  Created by Marcus Griffiths on 3/15/16.
//  Copyright © 2016 Griffy. All rights reserved.
//

import Foundation

protocol CatState {
    func entryBehavior(theCat: GameCat)
    func exitBehavior(theCat: GameCat)
    func update(theCat: GameCat)
}

class wanderState : CatState {
    func entryBehavior(theCat: GameCat) {
        
    }
    func exitBehavior(theCat: GameCat) {
        
    }
    func update(theCat: GameCat) {
        
    }
}
class eatState : CatState {
    func entryBehavior(theCat: GameCat) {
        
    }
    func exitBehavior(theCat: GameCat) {
        
    }
    func update(theCat: GameCat) {
        
    }
}
class sleepState : CatState {
    func entryBehavior(theCat: GameCat) {
        
    }
    func exitBehavior(theCat: GameCat) {
        
    }
    func update(theCat: GameCat) {
        
    }
}