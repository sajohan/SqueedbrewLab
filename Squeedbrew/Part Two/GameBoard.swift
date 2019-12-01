//
//  GameBoard.swift
//  Squeedbrew
//
//  Created by Johan Sandström on 2019-11-24.
//  Copyright © 2019 Squeed. All rights reserved.
//

import UIKit
import RealityKit
import ARKit

class GameBoard: Entity {
    required init() {
        super.init()
        
        for i in 0...15 {
            let card = Card()
            addChild(card)
            card.position = gridPosition(fromIndex: i, cardWidth: Card.width)
        }
    }
    
    private func gridPosition(fromIndex index: Int, cardWidth: Float) -> SIMD3<Float> {
        let cardSpacing: Float = 0.01
        let xPosition = (Float(index % 4) * (cardWidth + cardSpacing)) - cardWidth * 1.5
        let zPosition = (Float(index / 4) * (cardWidth + cardSpacing)) - cardWidth * 1.5
        return [Float(xPosition), 0, Float(zPosition)]
    }
}
