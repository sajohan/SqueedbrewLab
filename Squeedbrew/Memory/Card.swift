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
    
    /// Rotates the card to the specified angle
    private func rotate(toAngle angle: Float, animated: Bool) {
        // Copy current transform and change rotation
        var rotatedTransform = transform
        rotatedTransform.rotation = simd_quatf(angle: angle, axis: [1, 0, 0])
        
        if animated {
            move(to: rotatedTransform, relativeTo: parent, duration: 0.3, timingFunction: .easeInOut)
        } else {
            transform = rotatedTransform
        }
    }
    
    /// Scales the passed in modelEntity up or down to match width
    private func setMaxBaseWidth(_ width: Float, forModelEntity entity: ModelEntity) {
        let xDimension = entity.model!.mesh.bounds.extents.x
        let zDimension = entity.model!.mesh.bounds.extents.z
        let maxWidth = Float.maximum(xDimension, zDimension)
        let scale = width / maxWidth
        entity.scale = [scale, scale, scale]
    }
}
