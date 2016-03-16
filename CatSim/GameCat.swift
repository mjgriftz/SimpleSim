//
//  GameCat.swift
//  CatSim
//
//  Created by Marcus Griffiths on 3/15/16.
//  Copyright © 2016 Griffy. All rights reserved.
//

import Foundation
import SpriteKit

class GameCat : SKSpriteNode{

    var catState: CatState?
    let catImages: String
    var catAi: CatAI?
    var catVelocity: CGSize?
    
    init(imageSet: String) {
        self.catImages = imageSet
        super.init(texture: nil, color: UIColor.whiteColor(), size: CGSize(width: 128.0, height: 128.0))
        self.texture = SKTextureAtlas(named: imageSet).textureNamed("bestCatDown")
        self.catAi = CatAI(hostCat: self)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    func update() {
        catState?.update(self)
        catAi?.update()
    }
}
