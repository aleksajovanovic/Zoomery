//
//  Tile.swift
//  Zoomery
//
//  Created by Aleksa Jovanovic on 2015-09-27.
//  Copyright © 2015 Aleksa Jovanovic. All rights reserved.
//

import SpriteKit

class Tile:SKSpriteNode {
   
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(imageNamed: String) {
        let texture = SKTexture(imageNamed: imageNamed)
        super.init(texture: texture, color: SKColor.clearColor(), size: texture.size())
    }
}
