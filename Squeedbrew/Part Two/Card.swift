//
//  Card.swift
//  Squeedbrew
//
//  Created by Johan Sandström on 2019-11-24.
//  Copyright © 2019 Squeed. All rights reserved.
//

import UIKit
import RealityKit
import ARKit

class Card: Entity, HasModel {
    
    /// Size of side of card. 1 dm
    static let width: Float = 0.1
    /// Height of card. 5 mm
    static let height: Float = 0.005
    
    required init() {
        super.init()
        
        // Create card model
        let mesh = MeshResource.generateBox(size: [Card.width, Card.height, Card.width])
        let cardColor = UIColor.lightGray
        let material = SimpleMaterial(color: cardColor, isMetallic: true)
        components[ModelComponent] = ModelComponent(mesh: mesh, materials: [material])
    }
}
