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
    
    // MARK: Coaching view
    static func addCoachingView(toArView arView: ARView) {
        // Create
        let coachingView = ARCoachingOverlayView()
        coachingView.goal = .horizontalPlane
        coachingView.activatesAutomatically = true
        coachingView.session = arView.session
        
        // Add to ARView
        arView.addSubview(coachingView)
        
        // Layout
        coachingView.translatesAutoresizingMaskIntoConstraints = false
        coachingView.leadingAnchor.constraint(equalTo: arView.leadingAnchor, constant: 0).isActive = true
        coachingView.topAnchor.constraint(equalTo: arView.topAnchor, constant: 0).isActive = true
        arView.trailingAnchor.constraint(equalTo: coachingView.trailingAnchor, constant: 0).isActive = true
        arView.bottomAnchor.constraint(equalTo: coachingView.bottomAnchor, constant: 0).isActive = true
    }
    
    // MARK: Hiding and showing debug
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
}
