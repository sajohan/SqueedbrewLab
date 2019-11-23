//
//  BrewHelper.swift
//  Squeedbrew
//
//  Created by Johan Sandström on 2019-11-17.
//  Copyright © 2019 Squeed. All rights reserved.
//

import Foundation
import ARKit
import RealityKit

struct BrewHelper {
    
    static func addCoachingView(toArView arView: ARView) {
        // Create
        let coachingView = ARCoachingOverlayView()
        coachingView.goal = .horizontalPlane
        coachingView.activatesAutomatically = true
        
        // Add to ARView
        arView.addSubview(coachingView)
        
        // Layout
        coachingView.translatesAutoresizingMaskIntoConstraints = false
        coachingView.leadingAnchor.constraint(equalTo: arView.leadingAnchor, constant: 0).isActive = true
        coachingView.topAnchor.constraint(equalTo: arView.topAnchor, constant: 0).isActive = true
        arView.trailingAnchor.constraint(equalTo: coachingView.trailingAnchor, constant: 0).isActive = true
        arView.bottomAnchor.constraint(equalTo: coachingView.bottomAnchor, constant: 0).isActive = true
    }
    
    static func showDebugViews(onArView arView: ARView) {
        arView.debugOptions = [.showAnchorGeometry,
                               .showAnchorOrigins,
                               .showFeaturePoints,
                               .showPhysics,
                               .showWorldOrigin]
    }
    
    static func hideDebugViews(onArView arView: ARView) {
        arView.debugOptions = []
    }
    
    static func getPosition(fromIndex index: Int, cardWidth: Float) -> SIMD3<Float> {
        let cardSpacing: Float = 0.01
        let xPosition = (Float(index % 4) * (cardWidth + cardSpacing)) - cardWidth * 1.5
        let zPosition = (Float(index / 4) * (cardWidth + cardSpacing)) - cardWidth * 1.5
        return [Float(xPosition), 0, Float(zPosition)]
    }
}
