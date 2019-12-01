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
import Combine

class GameBoard: Entity {
    required init() {
        super.init()
        
        for i in 0...15 {
            let card = Card()
            addChild(card)
            card.position = gridPosition(fromIndex: i, cardWidth: Card.width)
        }
    }
    
    /// Returns x, y, and z coordinates for the supplied index
    private func gridPosition(fromIndex index: Int, cardWidth: Float) -> SIMD3<Float> {
        let cardSpacing: Float = 0.01
        let xPosition = (Float(index % 4) * (cardWidth + cardSpacing)) - cardWidth * 1.5
        let zPosition = (Float(index / 4) * (cardWidth + cardSpacing)) - cardWidth * 1.5
        return [Float(xPosition), 0, Float(zPosition)]
    }
    
    
    private var loadRequest: AnyCancellable?
    /// Loads the usdz models and calls the completed closure/callback
    private func loadModels(completed: @escaping ([ModelEntity]) -> Void) {
        loadRequest = Entity.loadModelAsync(named: "chair_swan")
            .append(Entity.loadModelAsync(named: "fender_stratocaster"))
            .append(Entity.loadModelAsync(named: "gramophone"))
            .append(Entity.loadModelAsync(named: "teapot"))
            .append(Entity.loadModelAsync(named: "toy_biplane"))
            .append(Entity.loadModelAsync(named: "toy_car"))
            .append(Entity.loadModelAsync(named: "toy_drummer"))
            .append(Entity.loadModelAsync(named: "tv_retro"))
            .append(Entity.loadModelAsync(named: "toy_robot_vintage"))
            .collect()
            .sink(receiveCompletion: { receiveCompletion in
                // Do nothing
            }) { (models) in
                completed(models)
        }
    }
}
